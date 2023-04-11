# rpmostree-tool

Wrapper of `rpm-ostree update` that compares previous update output.
Also outputs changelog diff.

Still experimental

## Usage

```shellsession
$ rpmostree-tool
Diff preview with last rpm-ostree update:
--- /var/home/petersen/.cache/rpmostree-tools/previous-update	2023-04-07 17:28:25.888141380 +0800
+++ /var/home/petersen/.cache/rpmostree-tools/latest-update	2023-04-08 16:52:17.208587593 +0800
@@ -1 +1 @@
-2 metadata, 0 content objects fetched; 53 KiB transferred in 2 seconds; 0 bytes content written
+2 metadata, 0 content objects fetched; 53 KiB transferred in 3 seconds; 0 bytes content written
@@ -9 +9 @@
-rpm-md repo 'updates'; generated: 2023-04-06T01:49:34Z solvables: 28727
+rpm-md repo 'updates'; generated: 2023-04-07T02:52:47Z solvables: 28764
@@ -11 +11 @@
-rpm-md repo 'updates-archive'; generated: 2023-04-07T03:57:22Z solvables: 36528
+rpm-md repo 'updates-archive'; generated: 2023-04-08T03:01:34Z solvables: 36786
@@ -14,2 +14,2 @@
-        Version: 37.20230406.0 (2023-04-06T00:43:29Z)
-         Commit: ae60887a4bc16a185e680c0de7c9f8c3d6d2172abaf544cf8c945efcb00ebb1a
+        Version: 37.20230408.0 (2023-04-08T02:02:08Z)
+         Commit: b27d2fc81e6fbb7d40e9a16b10b2d80125ddbf95bb58feb68c5a87e94ec602e2
@@ -17 +17 @@
-                 Signature made Thu 06 Apr 2023 08:43:34 AM using RSA key ID F55AD3FB5323552A
+                 Signature made Sat 08 Apr 2023 10:02:12 AM using RSA key ID F55AD3FB5323552A
@@ -30,0 +31 @@
+                 libzstd 1.5.4-1.fc37 -> 1.5.5-1.fc37

Press Enter to update:
⠐ Writing objects: 1                                                                                                                24 metadata, 49 content objects fetched; 98721 KiB transferred in 7 seconds; 139.6 MB content written
Writing objects: 1... done
Checking out tree b27d2fc... done
Enabled rpm-md repositories: fedora-cisco-openh264 updates fedora updates-archive
Updating metadata for 'fedora-cisco-openh264'... done
Updating metadata for 'updates'... done
Updating metadata for 'fedora'... done
Updating metadata for 'updates-archive'... done
Importing rpm-md... done
rpm-md repo 'fedora-cisco-openh264'; generated: 2022-10-06T11:01:40Z solvables: 4
rpm-md repo 'updates'; generated: 2023-04-07T02:52:47Z solvables: 28764
rpm-md repo 'fedora'; generated: 2022-11-05T08:04:38Z solvables: 66822
rpm-md repo 'updates-archive'; generated: 2023-04-08T03:01:34Z solvables: 36786
Resolving dependencies... done
Applying 10 overrides and 262 overlays
Processing packages... done
Running pre scripts... done
Running post scripts... done
Running posttrans scripts... done
Writing rpmdb... done
Writing OSTree commit... done
Staging deployment... done
Freed: 199.4 MB (pkgcache branches: 0)
Upgraded:
  container-selinux 2:2.206.0-1.fc37 -> 2:2.209.0-1.fc37
  dnsmasq 2.89-1.fc37 -> 2.89-2.fc37
  emoji-picker 2.22.1-1.fc37 -> 2.22.2-1.fc37
  hwdata 0.368-1.fc37 -> 0.369-1.fc37
  ibus-typing-booster 2.22.1-1.fc37 -> 2.22.2-1.fc37
  libsoup3 3.2.2-2.fc37 -> 3.2.2-3.fc37
  libzstd 1.5.4-1.fc37 -> 1.5.5-1.fc37
  mbedtls 2.28.2-1.fc37 -> 2.28.3-1.fc37
  podman 5:4.4.2-2.fc37 -> 5:4.4.4-3.fc37
  podman-gvproxy 5:4.4.2-2.fc37 -> 5:4.4.4-3.fc37
  qgnomeplatform-qt5 0.9.0-10.fc37 -> 0.9.0-11.fc37
  zchunk-libs 1.3.0-1.fc37 -> 1.3.1-1.fc37
Run "systemctl reboot" to start a reboot
Show changelog? [Y/n]:
Diff with last rpm-ostree update:
--- /var/home/petersen/.cache/rpmostree-tools/previous-changelog	2023-04-07 17:33:47.654187774 +0800
+++ /var/home/petersen/.cache/rpmostree-tools/latest-changelog	2023-04-08 16:54:41.497076118 +0800
@@ -2 +2 @@
-ostree diff commit to:   pending deployment (e877d6aef0f934b1f3f745851fa2b648fbe68a67eeafa4ad9c84a4c0e92f07e9)
+ostree diff commit to:   pending deployment (26db46a6c118a4781a9a927678d048470fa03c846baf73aace786b332c62e32b)
@@ -32,0 +33,4 @@
+
+  libzstd 1.5.4-1.fc37.x86_64 -> 1.5.5-1.fc37.x86_64
+    * Wed Apr 05 2023 Pádraig Brady <P@draigBrady.com> - 1.5.5-1
+    - Latest upstream

```

## Installation

`stack install` or `cabal install`

## Contributions

Feedback, suggestions, and patches welcome.

This might eventually get renamed to something like rpmostree-tool,
rpmostree-wrapper or even rpmost... if it should gain more command features.
