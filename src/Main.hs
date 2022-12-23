-- SPDX-License-Identifier: BSD-3-Clause

module Main (main) where

import Control.Monad.Extra (unless, void, whenJust)
import Data.List (isInfixOf)
import SimpleCmd
import System.Directory (createDirectoryIfMissing, doesFileExist, renameFile,
                         removeFile)
import System.Environment.XDG.BaseDir (getUserCacheDir)
import System.FilePath ((</>))
import System.IO (BufferMode(..), hSetBuffering, stdout)

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  let rpmostree = "/usr/bin/rpm-ostree"
  exists <- doesFileExist rpmostree
  unless exists $ error' $ rpmostree +-+ ": not found"
  staged <- ("true" `isInfixOf`) <$> cmd rpmostree ["status", "-J", "$.deployments[0].staged"]
  cachedir <- getUserCacheDir "rpmostree-updates"
  createDirectoryIfMissing True cachedir
  (latest, mprevious) <- cacheFiles staged cachedir "update"
  putStrLn "Preview:"
  ok <- pipeBool (rpmostree, ["update", "--preview"]) ("tee", [latest])
  if not ok
    then
    whenJust mprevious $ \previous ->
    renameFile previous latest
    else do
    whenJust mprevious $ \previous -> do
      (diff,_err) <- cmdStdErr "diff" ["-u0", previous, latest]
      let diffs = lines diff
      if length diffs <= 2
        -- FIXME print old timestamp
        then putStrLn "no new changes"
        else do
        putStrLn $ "\nChanges since last rpm-ostree update:\n" ++ unlines diffs
    putStr "Press Enter to update:"
    void getLine
    cmd_ rpmostree ["update"]
    putStr "Press Enter for changelog:"
    void getLine
    (latestClog,mpreviousClog) <- cacheFiles staged cachedir "changelog"
    pipe3_ (rpmostree,["db", "diff", "-c"]) ("tee", [latestClog]) ("less",[])

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
