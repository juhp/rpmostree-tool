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

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  exists <- doesFileExist rpmostree
  unless exists $ error' $ rpmostree +-+ ": not found"
  staged <- ("true" `isInfixOf`) <$> cmd rpmostree ["status", "-J", "$.deployments[0].staged"]
  cachedir <- getUserCacheDir "rpmostree-updates"
  createDirectoryIfMissing True cachedir
  changed <- cachedRpmOstree staged cachedir "update" ["update", "--preview"]
  when changed $ do
    prompt "to update"
    cmd_ rpmostree ["update"]
    prompt "for changelog"
    void $ cachedRpmOstree staged cachedir "changelog" ["db", "diff", "-c"]

cachedRpmOstree :: Bool -> FilePath -> String -> [String] -> IO Bool
cachedRpmOstree staged cachedir suffix args = do
  (latest, mprevious) <- cacheFiles staged cachedir suffix
  putStrLn "Preview:"
  ok <- pipeBool (rpmostree, args) ("tee", [latest])
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

-- FIXME check timestamps?
cacheFiles :: Bool -> FilePath -> FilePath -> IO (FilePath, Maybe FilePath)
cacheFiles staged dir suffix = do
  let latestCache = dir </> "latest-" ++ suffix
      previousCache =  dir </> "previous-" ++ suffix
  mprevious <-
    if staged
      then do
      have <- doesFileExist latestCache
      if have
        then do
        renameFile latestCache previousCache
        return $ Just previousCache
        else return Nothing
    else do
      removeFile latestCache
      return Nothing
  return (latestCache,mprevious)

prompt :: String -> IO ()
prompt txt = do
  putStr $ "Press Enter" +-+ txt ++ ":"
  void getLine
