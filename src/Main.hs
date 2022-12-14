-- SPDX-License-Identifier: BSD-3-Clause

module Main (main) where

import Control.Monad (unless)
import SimpleCmd
import System.Directory (createDirectoryIfMissing, doesFileExist, renameFile)
import System.Environment.XDG.BaseDir (getUserCacheDir)
import System.FilePath ((</>))

-- --preview command
main :: IO ()
main = do
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
    (diff,_err) <- cmdStdErr "diff" ["-u", previous, latest]
    if null diff
      then putStrLn "no new changes"
      else do
      putStrLn $ "Changes since last rpm-ostree update:\n" ++ diff
      cmd_ rpmostree ["update"]
