-- SPDX-License-Identifier: BSD-3-Clause

module Main (main) where

import Control.Monad (unless, void)
import SimpleCmd
import System.Directory (createDirectoryIfMissing, doesFileExist, renameFile)
import System.Environment.XDG.BaseDir (getUserCacheDir)
import System.FilePath ((</>))
import System.IO (BufferMode(..), hSetBuffering, stdout)

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  let rpmostree = "/usr/bin/rpm-ostree"
  exists <- doesFileExist rpmostree
  unless exists $ error' $ rpmostree +-+ ": not found"
  cachedir <- getUserCacheDir "rpmostree-updates"
  createDirectoryIfMissing True cachedir
  let latest = cachedir </> "latest-update"
      previous = cachedir </> "previous-update"
  whenM (doesFileExist latest) $
    renameFile latest previous
  putStrLn "Preview:"
  -- FIXME check for exit code 77?
  ok <- pipeBool (rpmostree, ["update", "--preview"]) ("tee", [latest])
  if not ok
    then renameFile previous latest
    else do
    (diff,_err) <- cmdStdErr "diff" ["-u0", previous, latest]
    if length (lines diff) <= 2
      -- FIXME print old timestamp
      then putStrLn "no new changes"
      else do
      putStrLn $ "Changes since last rpm-ostree update:\n" ++ diff
      putStr "Press Enter to update:"
      void getLine
      cmd_ rpmostree ["update"]
      putStr "Press Enter for changelog:"
      void getLine
      cmd_ rpmostree ["db", "diff", "-c"]
