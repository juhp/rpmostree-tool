-- SPDX-License-Identifier: BSD-3-Clause

module Main (main) where

import Control.Monad.Extra (unless, void, when, whenJust)
import Data.List (isInfixOf)
import SimpleCmd
import System.Directory (createDirectoryIfMissing, doesFileExist, renameFile,
                         removeFile)
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
  exists <- doesFileExist rpmostree
  unless exists $ error' $ rpmostree +-+ ": not found"
  cachedir <- getUserCacheDir "rpmostree-updates"
  createDirectoryIfMissing True cachedir
  -- whether latest is a staged deployment
  staged <- ("true" `isInfixOf`) <$> cmd rpmostree ["status", "-J", "$.deployments[0].staged"]
  putStrLn "Preview:"
  changed <- cachedRpmOstree staged cachedir Update
  when changed $ do
    prompt "to update"
    cmd_ rpmostree ["update"]
    prompt "for changelog"
    void $ cachedRpmOstree staged cachedir Changelog

cachedRpmOstree :: Bool -> FilePath -> Mode -> IO Bool
cachedRpmOstree staged cachedir mode = do
  (latest, mprevious) <- cacheFiles
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
        if length diffs <= 2
          -- FIXME print old timestamp
          then do
          putStrLn "no new changes"
          return False
          else do
          putStrLn $ "\nChanges since last rpm-ostree update:\n" ++ unlines diffs
          return True
      Nothing -> return False
  where
    cacheFiles :: IO (FilePath, Maybe FilePath)
    cacheFiles = do
      let latestCache = cachedir </> "latest-" ++ show mode
          previousCache =  cachedir </> "previous-" ++ show mode
      haveLatest <- doesFileExist latestCache
      mprevious <-
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
      return (latestCache,mprevious)

prompt :: String -> IO ()
prompt txt = do
  putStr $ "Press Enter" +-+ txt ++ ":"
  void getLine
