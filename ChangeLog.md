# History for rpmostree-tool

## 0.1.3
- renamed from rpmostree-update
- new 'update' and 'install' commands

## 0.1.2 (2023-04-08)
- compact output: elide stdout for update and changelog if staged cache

## 0.1.1 (2023-01-31)
- fix not updating when no staged deployment
- do not show update diff if trivially short
- check for /sysroot before rpm-ostree
- print if latest deployment is live
- if no previous or new update return False
- use simple-prompt

## 0.1.0 (2023-01-21)
- initial release with cached update and changelog diffs
