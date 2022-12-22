-- SPDX-License-Identifier: BSD-3-Clause

module Main (main) where

import Control.Monad (unless, void, when)
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
  let latest = cachedir </> "latest-update"
      previous = cachedir </> "previous-update"
  haveCache <-
    if staged
    then do
      have <- doesFileExist latest
      when have $
        renameFile latest previous
      return have
    else do
      removeFile latest
      return False
  putStrLn "Preview:"
  ok <- pipeBool (rpmostree, ["update", "--preview"]) ("tee", [latest])
  if not ok
    then
    when haveCache $
    renameFile previous latest
    else do
    when haveCache $ do
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
    -- FIXME save changelog and diff it
    pipe_ (rpmostree,["db", "diff", "-c"]) ("less",[])
