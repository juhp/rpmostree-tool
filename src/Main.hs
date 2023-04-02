-- SPDX-License-Identifier: BSD-3-Clause

module Main (main) where

import Control.Monad.Extra (unless, void, when, whenJust)
import Data.List (isPrefixOf, isInfixOf)
import SimpleCmd
import SimplePrompt
import System.Directory (createDirectoryIfMissing, doesDirectoryExist,
                         doesFileExist, removeFile, renameFile)
import System.Environment.XDG.BaseDir (getUserCacheDir)
import System.FilePath ((</>))
import System.IO (BufferMode(..), hSetBuffering, stdout)

rpmostree :: String
rpmostree = "/usr/bin/rpm-ostree"

data Mode = Update | Changelog

instance Show Mode where
  show Update = "update"
  show Changelog = "changelog"

modeArgs :: Mode -> [String]
modeArgs Update = ["update", "--preview"]
modeArgs Changelog = ["db", "diff", "-c"]

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  let sysrootDir = "/sysroot"
  sysroot <- doesDirectoryExist sysrootDir
  unless sysroot $
    error' $ "no" +-+ sysrootDir +-+ "found: not a rpm-ostree system?"
  exists <- doesFileExist rpmostree
  unless exists $
    error' $ rpmostree +-+ ": not found"
  cachedir <- getUserCacheDir "rpmostree-updates"
  createDirectoryIfMissing True cachedir
  -- whether latest is a staged deployment
  staged <- ("true" `isInfixOf`) <$> cmd rpmostree ["status", "-J", "$.deployments[0].staged"]
  -- FIXME
  unless staged $
    putStrLn "current latest deployment is live"
  putStrLn "Preview:"
  changed <- cachedRpmOstree staged cachedir Update
  when changed $ do
    prompt_ "Press Enter to update"
    cmd_ rpmostree ["update"]
  showChangelog <- yesno (Just changed) "Show changelog"
  when showChangelog $
    void $ cachedRpmOstree staged cachedir Changelog

cachedRpmOstree :: Bool -> FilePath -> Mode -> IO Bool
cachedRpmOstree staged cachedir mode = do
  let latest = cachedir </> "latest-" ++ show mode
  mprevious <- cacheFile latest
  ok <- pipeBool (rpmostree, modeArgs mode) ("tee", [latest])
  if not ok
    then do
    whenJust mprevious $ \previous ->
      renameFile previous latest
    return False
    else
    case mprevious of
      Just previous -> do
        (diff,_err) <- cmdStdErr "diff" ["-u0", previous, latest]
        let diffs = lines diff
        when (length (filter (not . noise) diffs) > 3) $
          putStrLn $ "\nDiff with last rpm-ostree update:\n" ++ unlines diffs
        if length diffs <= 9
          -- FIXME print old timestamp
          then do
          putStrLn "no new changes"
          return False
          else return True
      Nothing -> not <$> grep_ "No updates available." latest
  where
    cacheFile :: FilePath -> IO (Maybe FilePath)
    cacheFile latestCache = do
      let previousCache =  cachedir </> "previous-" ++ show mode
      haveLatest <- doesFileExist latestCache
      if haveLatest
        then do
        useCache <-
          case mode of
            Update -> return staged
            Changelog -> do
              -- ostree diff commit from: booted deployment (81ad560ed850559259e46d5739e8d9ac8714fbcbbd0d24257a8934db7730edab)
              cachedBootedDeployment <- init . tail . last . words <$> cmd "head" ["-1", latestCache]
              bootedChecksum <- cmd rpmostree ["status", "-b", "-J", "$.deployments[0].checksum"]
              return $ cachedBootedDeployment `isInfixOf` bootedChecksum
        if useCache
          then do
          renameFile latestCache previousCache
          return $ Just previousCache
          else do
          removeFile latestCache
          return Nothing
        else return Nothing

    noise :: String -> Bool
    noise cs = "@@ " `isPrefixOf` cs ||
               " 0 content objects fetched; " `isInfixOf` cs
