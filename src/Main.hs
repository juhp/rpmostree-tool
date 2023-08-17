-- SPDX-License-Identifier: BSD-3-Clause

module Main (main) where

import Control.Monad.Extra (unless, unlessM, void, when, whenM, whenJust)
import Data.List (isPrefixOf, isInfixOf)
import Data.Maybe (isNothing)
import SimpleCmd (cmd, cmdLines, cmdStdErr, error', grep_, pipeBool, (+-+))
import SimpleCmdArgs (simpleCmdArgs, subcommands, Subcommand(..), some, strArg)
import SimplePrompt (promptEnter, yesNoDefault)
import System.Directory (createDirectoryIfMissing, doesDirectoryExist,
                         doesFileExist, removeFile, renameFile,
                         renameDirectory)
import System.Environment.XDG.BaseDir (getUserCacheDir)
import System.Exit (ExitCode(ExitSuccess))
import System.FilePath ((</>))
import System.IO (BufferMode(..), hSetBuffering, openFile, stdout, IOMode(WriteMode))
import System.Process (runProcess,waitForProcess)

import Paths_rpmostree_tool (version)

rpmostree :: String
rpmostree = "/usr/bin/rpm-ostree"

data Mode = Update | Changelog | Install [String]
  deriving Eq

instance Show Mode where
  show Update = "update"
  show Changelog = "changelog"
  show (Install _) = "install"

modeArgs :: Mode -> [String]
modeArgs Update = ["update", "--preview"]
modeArgs Changelog = ["db", "diff", "-c"]
modeArgs (Install ps) = "install" : ps

main :: IO ()
main =
  simpleCmdArgs (Just version)
  "rpm-ostree wrapper tool"
  "see https://github.com/juhp/rpmostree-tool#readme" $
  subcommands
  [ Subcommand "update"
    "rpm-ostree update with diff output against previous pull" $
    runCmd <$> pure Update
  , Subcommand "install"
    "rpm-ostree install with diff output against previous pull" $
    runCmd <$>
    Install <$> some (strArg "PKG")
  ]

runCmd :: Mode -> IO ()
runCmd mode = do
  hSetBuffering stdout NoBuffering
  let sysrootDir = "/sysroot"
  sysroot <- doesDirectoryExist sysrootDir
  unless sysroot $
    error' $ "no" +-+ sysrootDir +-+ "found: not a rpm-ostree system?"
  exists <- doesFileExist rpmostree
  unless exists $
    error' $ rpmostree +-+ ": not found"
  oldcachedir <- getUserCacheDir "rpmostree-updates"
  cachedir <- getUserCacheDir "rpmostree-tool"
  whenM (doesDirectoryExist oldcachedir) $
    unlessM (doesDirectoryExist cachedir) $
    renameDirectory oldcachedir cachedir
  createDirectoryIfMissing True cachedir
  -- whether latest is a staged deployment
  staged <- ("true" `isInfixOf`) <$> cmd rpmostree ["status", "-J", "$.deployments[0].staged"]
  putStrLn $ "current deployment 0 is" +-+ if staged then "staged" else "live"
  changed <- cachedRpmOstree staged cachedir mode
  case mode of
    Update -> do
      when changed $ do
        promptEnter "Press Enter to update"
        -- filter out 'Run "systemctl reboot" to start a reboot'
        out <- cmdLines rpmostree ["update"]
        mapM_ putStrLn $ init out
        showChangelog <- yesNoDefault changed "Show changelog"
        when showChangelog $
          void $ cachedRpmOstree staged cachedir Changelog
    _ -> return ()

-- FIXME debug
cachedRpmOstree :: Bool -> FilePath -> Mode -> IO Bool
cachedRpmOstree staged cachedir mode = do
  let latest = cachedir </> show mode ++ "-latest"
  mprevious <- cacheFile latest
  -- FIXME: or debug
  ok <- if isNothing mprevious
        then pipeBool (rpmostree, modeArgs mode) ("tee", [latest])
        else cmdToFile (rpmostree, modeArgs mode) latest
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
          putStrLn $ "Diff" +-+ (if mode == Update then "preview" else "") +-+ "with last rpm-ostree update:\n" ++ unlines diffs
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
      let previousCache =  cachedir </> show mode ++ "-previous"
      haveLatest <- doesFileExist latestCache
      if haveLatest
        then do
        useCache <-
          case mode of
            Changelog -> do
              -- ostree diff commit from: booted deployment (81ad560ed850559259e46d5739e8d9ac8714fbcbbd0d24257a8934db7730edab)
              cachedBootedDeployment <- init . tail . last . words <$> cmd "head" ["-1", latestCache]
              bootedChecksum <- cmd rpmostree ["status", "-b", "-J", "$.deployments[0].checksum"]
              return $ cachedBootedDeployment `isInfixOf` bootedChecksum
            _ -> return staged
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

cmdToFile :: (String, [String]) -> FilePath -> IO Bool
cmdToFile (c,args) file = do
  h <- openFile file WriteMode
  p <- runProcess c args Nothing Nothing Nothing (Just h) Nothing
  ret <- waitForProcess p
  -- FIXME replace with boolWrapper
  return $ ret == ExitSuccess
