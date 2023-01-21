# rpmostree-update

Wrapper of `rpm-ostree update` that compares previous update output.
Also outputs changelog with diff.

Still experimental

## Usage

```shellsession
$ rpmostree-update
Preview:
2 metadata, 0 content objects fetched; 52 KiB transferred in 3 seconds; 0 bytes content written
Enabled rpm-md repositories: fedora-cisco-openh264 updates fedora updates-archive
Updating metadata for 'fedora-cisco-openh264'...done
Updating metadata for 'updates'...done
Updating metadata for 'fedora'...done
Updating metadata for 'updates-archive'...done
Importing rpm-md...done
rpm-md repo 'fedora-cisco-openh264'; generated: 2022-10-06T11:01:40Z solvables: 4
rpm-md repo 'updates'; generated: 2023-01-21T03:21:42Z solvables: 16165
rpm-md repo 'fedora'; generated: 2022-11-10T09:30:00Z solvables: 66822
rpm-md repo 'updates-archive'; generated: 2023-01-21T03:52:26Z solvables: 19091
Note: --check and --preview may be unreliable.  See https://github.com/coreos/rpm-ostree/issues/1579
AvailableUpdate:
        Version: 37.20230120.0 (2023-01-20T00:46:10Z)
         Commit: 99a409a04f7249f49224be6b07f45c082ed82ffa83d75c2eaddc00d66a999a4c
   GPGSignature: 1 signature
                 Signature made Sat 21 Jan 2023 04:25:29 AM using RSA key ID F55AD3FB5323552A
                 Good signature from "Fedora <fedora-37-primary@fedoraproject.org>"
  SecAdvisories: FEDORA-2023-dbe1157188  Low        nautilus-43.2-1.fc37.x86_64
                 FEDORA-2023-dbe1157188  Low        nautilus-extensions-43.2-1.fc37.x86_64
                   CVE-2022-37290 nautilus: NULL pointer dereference via pasting crafted zip file
                   https://bugzilla.redhat.com/show_bug.cgi?id=2149911
                 FEDORA-2023-9718cc6113  Important  git-core-2.39.1-1.fc37.x86_64
                 FEDORA-2023-9718cc6113  Important  git-core-doc-2.39.1-1.fc37.noarch
                   CVE-2022-23521 git: gitattributes parsing integer overflow
                   https://bugzilla.redhat.com/show_bug.cgi?id=2162055
                   CVE-2022-41903 git: Heap overflow in `git archive`, `git log --format` leading to RCE
                   https://bugzilla.redhat.com/show_bug.cgi?id=2162056
                 FEDORA-2023-ee8bfe7d72  Critical   firefox-109.0-1.fc37.x86_64
                 FEDORA-2023-ee8bfe7d72  Critical   firefox-langpacks-109.0-1.fc37.x86_64
       Upgraded: ModemManager 1.18.8-2.fc37 -> 1.18.12-1.fc37
                 ModemManager-glib 1.18.8-2.fc37 -> 1.18.12-1.fc37
                 NetworkManager 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
                 NetworkManager-adsl 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
                 NetworkManager-bluetooth 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
                 NetworkManager-config-connectivity-fedora 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
                 NetworkManager-libnm 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
                 NetworkManager-ppp 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
                 NetworkManager-wifi 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
                 NetworkManager-wwan 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
                 alsa-sof-firmware 2.2.3-1.fc37 -> 2.2.4-2.fc37
                 chromium 107.0.5304.121-1.fc37 -> 109.0.5414.74-1.fc37
                 chromium-common 107.0.5304.121-1.fc37 -> 109.0.5414.74-1.fc37
                 container-selinux 2:2.195.1-1.fc37 -> 2:2.198.0-1.fc37
                 distribution-gpg-keys 1.80-1.fc37 -> 1.81-1.fc37
                 efivar-libs 38-5.fc37 -> 38-6.fc37
                 emoji-picker 2.19.12-1.fc37 -> 2.19.13-2.fc37
                 firefox 108.0.1-3.fc37 -> 109.0-1.fc37
                 firefox-langpacks 108.0.1-3.fc37 -> 109.0-1.fc37
                 flatpak 1.14.1-1.fc37 -> 1.14.1-2.fc37
                 flatpak-libs 1.14.1-1.fc37 -> 1.14.1-2.fc37
                 flatpak-selinux 1.14.1-1.fc37 -> 1.14.1-2.fc37
                 flatpak-session-helper 1.14.1-1.fc37 -> 1.14.1-2.fc37
                 git-core 2.39.0-1.fc37 -> 2.39.1-1.fc37
                 git-core-doc 2.39.0-1.fc37 -> 2.39.1-1.fc37
                 gjs 1.74.1-3.fc37 -> 1.74.1-5.fc37
                 glibc 2.36-8.fc37 -> 2.36-9.fc37
                 glibc-all-langpacks 2.36-8.fc37 -> 2.36-9.fc37
                 glibc-common 2.36-8.fc37 -> 2.36-9.fc37
                 glibc-gconv-extra 2.36-8.fc37 -> 2.36-9.fc37
                 gnome-software 43.2-1.fc37 -> 43.3-1.fc37
                 gnome-software-rpm-ostree 43.2-1.fc37 -> 43.3-1.fc37
                 grub2-common 1:2.06-72.fc37 -> 1:2.06-75.fc37
                 grub2-efi-ia32 1:2.06-72.fc37 -> 1:2.06-75.fc37
                 grub2-efi-x64 1:2.06-72.fc37 -> 1:2.06-75.fc37
                 grub2-pc 1:2.06-72.fc37 -> 1:2.06-75.fc37
                 grub2-pc-modules 1:2.06-72.fc37 -> 1:2.06-75.fc37
                 grub2-tools 1:2.06-72.fc37 -> 1:2.06-75.fc37
                 grub2-tools-minimal 1:2.06-72.fc37 -> 1:2.06-75.fc37
                 gst-editing-services 1.20.4-1.fc37 -> 1.20.5-1.fc37
                 gstreamer1 1.20.4-1.fc37 -> 1.20.5-1.fc37
                 gstreamer1-plugins-bad-free 1.20.4-1.fc37 -> 1.20.5-1.fc37
                 gstreamer1-plugins-base 1.20.4-1.fc37 -> 1.20.5-1.fc37
                 gstreamer1-plugins-good 1.20.4-1.fc37 -> 1.20.5-1.fc37
                 gstreamer1-plugins-good-qt 1.20.4-1.fc37 -> 1.20.5-1.fc37
                 gstreamer1-plugins-ugly-free 1.20.4-1.fc37 -> 1.20.5-1.fc37
                 gtk4 4.8.2-2.fc37 -> 4.8.3-1.fc37
                 gvfs 1.50.2-2.fc37 -> 1.50.3-1.fc37
                 gvfs-afc 1.50.2-2.fc37 -> 1.50.3-1.fc37
                 gvfs-afp 1.50.2-2.fc37 -> 1.50.3-1.fc37
                 gvfs-archive 1.50.2-2.fc37 -> 1.50.3-1.fc37
                 gvfs-client 1.50.2-2.fc37 -> 1.50.3-1.fc37
                 gvfs-fuse 1.50.2-2.fc37 -> 1.50.3-1.fc37
                 gvfs-goa 1.50.2-2.fc37 -> 1.50.3-1.fc37
                 gvfs-gphoto2 1.50.2-2.fc37 -> 1.50.3-1.fc37
                 gvfs-mtp 1.50.2-2.fc37 -> 1.50.3-1.fc37
                 gvfs-smb 1.50.2-2.fc37 -> 1.50.3-1.fc37
                 ibus 1.5.27-4.fc37 -> 1.5.27-5.fc37
                 ibus-gtk3 1.5.27-4.fc37 -> 1.5.27-5.fc37
                 ibus-gtk4 1.5.27-4.fc37 -> 1.5.27-5.fc37
                 ibus-libs 1.5.27-4.fc37 -> 1.5.27-5.fc37
                 ibus-setup 1.5.27-4.fc37 -> 1.5.27-5.fc37
                 ibus-typing-booster 2.19.12-1.fc37 -> 2.19.13-2.fc37
                 iptables-libs 1.8.8-3.fc37 -> 1.8.8-4.fc37
                 iptables-nft 1.8.8-3.fc37 -> 1.8.8-4.fc37
                 kernel 6.0.17-300.fc37 -> 6.1.6-200.fc37
                 kernel-core 6.0.17-300.fc37 -> 6.1.6-200.fc37
                 kernel-modules 6.0.17-300.fc37 -> 6.1.6-200.fc37
                 kernel-modules-extra 6.0.17-300.fc37 -> 6.1.6-200.fc37
                 kf5-filesystem 5.101.0-1.fc37 -> 5.102.0-1.fc37
                 libXpm 3.5.13-8.fc37 -> 3.5.14-1.fc37
                 libinput 1.22.0-2.fc37 -> 1.22.1-1.fc37
                 libqmi 1.30.6-2.fc37 -> 1.30.8-1.fc37
                 libqmi-utils 1.30.6-2.fc37 -> 1.30.8-1.fc37
                 libsoup3 3.2.2-1.fc37 -> 3.2.2-2.fc37
                 libwebp 1.2.4-2.fc37 -> 1.3.0-1.fc37
                 llvm-libs 15.0.6-1.fc37 -> 15.0.7-1.fc37
                 lz4-libs 1.9.3-5.fc37 -> 1.9.4-1.fc37
                 mesa-dri-drivers 22.3.2-1.fc37 -> 22.3.3-1.fc37
                 mesa-filesystem 22.3.2-1.fc37 -> 22.3.3-1.fc37
                 mesa-libEGL 22.3.2-1.fc37 -> 22.3.3-1.fc37
                 mesa-libGL 22.3.2-1.fc37 -> 22.3.3-1.fc37
                 mesa-libgbm 22.3.2-1.fc37 -> 22.3.3-1.fc37
                 mesa-libglapi 22.3.2-1.fc37 -> 22.3.3-1.fc37
                 mesa-libxatracker 22.3.2-1.fc37 -> 22.3.3-1.fc37
                 mesa-va-drivers 22.3.2-1.fc37 -> 22.3.3-1.fc37
                 mesa-vulkan-drivers 22.3.2-1.fc37 -> 22.3.3-1.fc37
                 mozjs102 102.6.0-1.fc37 -> 102.7.0-1.fc37
                 mpg123-libs 1.31.1-1.fc37 -> 1.31.2-1.fc37
                 nautilus 43.1-1.fc37 -> 43.2-1.fc37
                 nautilus-extensions 43.1-1.fc37 -> 43.2-1.fc37
                 nspr 4.35.0-2.fc37 -> 4.35.0-3.fc37
                 nss 3.85.0-1.fc37 -> 3.87.0-1.fc37
                 nss-softokn 3.85.0-1.fc37 -> 3.87.0-1.fc37
                 nss-softokn-freebl 3.85.0-1.fc37 -> 3.87.0-1.fc37
                 nss-sysinit 3.85.0-1.fc37 -> 3.87.0-1.fc37
                 nss-util 3.85.0-1.fc37 -> 3.87.0-1.fc37
                 orca 43.0-1.fc37 -> 43.1-1.fc37
                 pipewire 0.3.63-1.fc37 -> 0.3.64-1.fc37
                 pipewire-alsa 0.3.63-1.fc37 -> 0.3.64-1.fc37
                 pipewire-gstreamer 0.3.63-1.fc37 -> 0.3.64-1.fc37
                 pipewire-jack-audio-connection-kit 0.3.63-1.fc37 -> 0.3.64-1.fc37
                 pipewire-libs 0.3.63-1.fc37 -> 0.3.64-1.fc37
                 pipewire-pulseaudio 0.3.63-1.fc37 -> 0.3.64-1.fc37
                 pipewire-utils 0.3.63-1.fc37 -> 0.3.64-1.fc37
                 poppler 22.08.0-2.fc37 -> 22.08.0-3.fc37
                 poppler-cpp 22.08.0-2.fc37 -> 22.08.0-3.fc37
                 poppler-glib 22.08.0-2.fc37 -> 22.08.0-3.fc37
                 poppler-utils 22.08.0-2.fc37 -> 22.08.0-3.fc37
                 python-unversioned-command 3.11.1-1.fc37 -> 3.11.1-3.fc37
                 python3 3.11.1-1.fc37 -> 3.11.1-3.fc37
                 python3-libs 3.11.1-1.fc37 -> 3.11.1-3.fc37
                 qgnomeplatform-qt5 0.9.0-5.fc37 -> 0.9.0-6.fc37
                 qt5-qtbase 5.15.7-1.fc37 -> 5.15.8-2.fc37
                 qt5-qtbase-common 5.15.7-1.fc37 -> 5.15.8-2.fc37
                 qt5-qtbase-gui 5.15.7-1.fc37 -> 5.15.8-2.fc37
                 qt5-qtdeclarative 5.15.7-1.fc37 -> 5.15.8-1.fc37
                 qt5-qtwayland 5.15.7-1.fc37 -> 5.15.8-1.fc37
                 qt5-qtx11extras 5.15.7-1.fc37 -> 5.15.8-1.fc37
                 qt5-qtxmlpatterns 5.15.7-1.fc37 -> 5.15.8-1.fc37
                 rav1e-libs 0.5.1-5.fc37 -> 0.5.1-6.fc37
                 selinux-policy 37.17-1.fc37 -> 37.18-1.fc37
                 selinux-policy-targeted 37.17-1.fc37 -> 37.18-1.fc37
                 tree 2.0.2-2.fc37 -> 2.1.0-1.fc37
                 unbound-anchor 1.17.0-1.fc37 -> 1.17.1-1.fc37
                 unbound-libs 1.17.0-1.fc37 -> 1.17.1-1.fc37
                 usbutils 014-3.fc37 -> 015-1.fc37
                 vim-data 2:9.0.1054-1.fc37 -> 2:9.0.1182-1.fc37
                 vim-minimal 2:9.0.1054-1.fc37 -> 2:9.0.1182-1.fc37
                 xorg-x11-server-Xorg 1.20.14-12.fc37 -> 1.20.14-15.fc37
                 xorg-x11-server-common 1.20.14-12.fc37 -> 1.20.14-15.fc37

Changes since last rpm-ostree update:
--- /var/home/petersen/.cache/rpmostree-updates/previous-update	2023-01-20 16:28:08.294410765 +0800
+++ /var/home/petersen/.cache/rpmostree-updates/latest-update	2023-01-21 15:53:48.376132438 +0800
@@ -1 +1 @@
-1 metadata, 0 content objects fetched; 591 B transferred in 3 seconds; 0 bytes content written
+2 metadata, 0 content objects fetched; 52 KiB transferred in 3 seconds; 0 bytes content written
@@ -9 +9 @@
-rpm-md repo 'updates'; generated: 2023-01-19T06:02:14Z solvables: 16068
+rpm-md repo 'updates'; generated: 2023-01-21T03:21:42Z solvables: 16165
@@ -11 +11 @@
-rpm-md repo 'updates-archive'; generated: 2023-01-19T06:37:57Z solvables: 18909
+rpm-md repo 'updates-archive'; generated: 2023-01-21T03:52:26Z solvables: 19091
@@ -14,2 +14,2 @@
-        Version: 37.20230119.0 (2023-01-19T00:47:27Z)
-         Commit: 20d7c89fc17db70c770f7b2f2967fd466300f8480a47adb450de84be44502b36
+        Version: 37.20230120.0 (2023-01-20T00:46:10Z)
+         Commit: 99a409a04f7249f49224be6b07f45c082ed82ffa83d75c2eaddc00d66a999a4c
@@ -17 +17 @@
-                 Signature made Thu 19 Jan 2023 11:58:11 AM using RSA key ID F55AD3FB5323552A
+                 Signature made Sat 21 Jan 2023 04:25:29 AM using RSA key ID F55AD3FB5323552A
@@ -22,0 +23,6 @@
+                 FEDORA-2023-9718cc6113  Important  git-core-2.39.1-1.fc37.x86_64
+                 FEDORA-2023-9718cc6113  Important  git-core-doc-2.39.1-1.fc37.noarch
+                   CVE-2022-23521 git: gitattributes parsing integer overflow
+                   https://bugzilla.redhat.com/show_bug.cgi?id=2162055
+                   CVE-2022-41903 git: Heap overflow in `git archive`, `git log --format` leading to RCE
+                   https://bugzilla.redhat.com/show_bug.cgi?id=2162056
@@ -36,2 +42,2 @@
-                 chromium 107.0.5304.121-1.fc37 -> 108.0.5359.124-3.fc37
-                 chromium-common 107.0.5304.121-1.fc37 -> 108.0.5359.124-3.fc37
+                 chromium 107.0.5304.121-1.fc37 -> 109.0.5414.74-1.fc37
+                 chromium-common 107.0.5304.121-1.fc37 -> 109.0.5414.74-1.fc37
@@ -47,0 +54,2 @@
+                 git-core 2.39.0-1.fc37 -> 2.39.1-1.fc37
+                 git-core-doc 2.39.0-1.fc37 -> 2.39.1-1.fc37

Press Enter to update:
⠦ Receiving objects; 65% (342/522) 14.6 MB/s 101.9 MB                                                                               50 metadata, 472 content objects fetched; 100976 KiB transferred in 7 seconds; 151.6 MB content written
Receiving objects; 65% (342/522) 14.6 MB/s 101.9 MB... done
Checking out tree 99a409a... done
Enabled rpm-md repositories: fedora-cisco-openh264 updates fedora updates-archive
Updating metadata for 'fedora-cisco-openh264'... done
Updating metadata for 'updates'... done
Updating metadata for 'fedora'... done
Updating metadata for 'updates-archive'... done
Importing rpm-md... done
rpm-md repo 'fedora-cisco-openh264'; generated: 2022-10-06T11:01:40Z solvables: 4
rpm-md repo 'updates'; generated: 2023-01-19T06:02:14Z solvables: 16068
rpm-md repo 'fedora'; generated: 2022-11-10T09:30:00Z solvables: 66822
rpm-md repo 'updates-archive'; generated: 2023-01-21T03:52:26Z solvables: 19091
Resolving dependencies... done
Will download: 2 packages (86.9 MB)
Downloading from 'updates-archive'... done
Importing packages... done
Applying 10 overrides and 272 overlays
Processing packages... done
Running pre scripts... done
Running post scripts... done
Running posttrans scripts... done
Writing rpmdb... done
Writing OSTree commit... done
Staging deployment... done
Freed: 440.5 MB (pkgcache branches: 2)
Upgraded:
  ModemManager 1.18.8-2.fc37 -> 1.18.12-1.fc37
  ModemManager-glib 1.18.8-2.fc37 -> 1.18.12-1.fc37
  NetworkManager 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
  NetworkManager-adsl 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
  NetworkManager-bluetooth 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
  NetworkManager-config-connectivity-fedora 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
  NetworkManager-libnm 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
  NetworkManager-ppp 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
  NetworkManager-wifi 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
  NetworkManager-wwan 1:1.40.6-1.fc37 -> 1:1.40.10-1.fc37
  alsa-sof-firmware 2.2.3-1.fc37 -> 2.2.4-2.fc37
  chromium 107.0.5304.121-1.fc37 -> 109.0.5414.74-1.fc37
  chromium-common 107.0.5304.121-1.fc37 -> 109.0.5414.74-1.fc37
  container-selinux 2:2.195.1-1.fc37 -> 2:2.198.0-1.fc37
  distribution-gpg-keys 1.80-1.fc37 -> 1.81-1.fc37
  efivar-libs 38-5.fc37 -> 38-6.fc37
  emoji-picker 2.19.12-1.fc37 -> 2.19.13-2.fc37
  firefox 108.0.1-3.fc37 -> 109.0-1.fc37
  flatpak 1.14.1-1.fc37 -> 1.14.1-2.fc37
  flatpak-libs 1.14.1-1.fc37 -> 1.14.1-2.fc37
  flatpak-selinux 1.14.1-1.fc37 -> 1.14.1-2.fc37
  flatpak-session-helper 1.14.1-1.fc37 -> 1.14.1-2.fc37
  git-core 2.39.0-1.fc37 -> 2.39.1-1.fc37
  git-core-doc 2.39.0-1.fc37 -> 2.39.1-1.fc37
  gjs 1.74.1-3.fc37 -> 1.74.1-5.fc37
  glibc 2.36-8.fc37 -> 2.36-9.fc37
  glibc-all-langpacks 2.36-8.fc37 -> 2.36-9.fc37
  glibc-common 2.36-8.fc37 -> 2.36-9.fc37
  glibc-gconv-extra 2.36-8.fc37 -> 2.36-9.fc37
  gnome-software 43.2-1.fc37 -> 43.3-1.fc37
  gnome-software-rpm-ostree 43.2-1.fc37 -> 43.3-1.fc37
  grub2-common 1:2.06-72.fc37 -> 1:2.06-75.fc37
  grub2-efi-ia32 1:2.06-72.fc37 -> 1:2.06-75.fc37
  grub2-efi-x64 1:2.06-72.fc37 -> 1:2.06-75.fc37
  grub2-pc 1:2.06-72.fc37 -> 1:2.06-75.fc37
  grub2-pc-modules 1:2.06-72.fc37 -> 1:2.06-75.fc37
  grub2-tools 1:2.06-72.fc37 -> 1:2.06-75.fc37
  grub2-tools-minimal 1:2.06-72.fc37 -> 1:2.06-75.fc37
  gst-editing-services 1.20.4-1.fc37 -> 1.20.5-1.fc37
  gstreamer1 1.20.4-1.fc37 -> 1.20.5-1.fc37
  gstreamer1-plugins-bad-free 1.20.4-1.fc37 -> 1.20.5-1.fc37
  gstreamer1-plugins-base 1.20.4-1.fc37 -> 1.20.5-1.fc37
  gstreamer1-plugins-good 1.20.4-1.fc37 -> 1.20.5-1.fc37
  gstreamer1-plugins-good-qt 1.20.4-1.fc37 -> 1.20.5-1.fc37
  gstreamer1-plugins-ugly-free 1.20.4-1.fc37 -> 1.20.5-1.fc37
  gtk4 4.8.2-2.fc37 -> 4.8.3-1.fc37
  gvfs 1.50.2-2.fc37 -> 1.50.3-1.fc37
  gvfs-afc 1.50.2-2.fc37 -> 1.50.3-1.fc37
  gvfs-afp 1.50.2-2.fc37 -> 1.50.3-1.fc37
  gvfs-archive 1.50.2-2.fc37 -> 1.50.3-1.fc37
  gvfs-client 1.50.2-2.fc37 -> 1.50.3-1.fc37
  gvfs-fuse 1.50.2-2.fc37 -> 1.50.3-1.fc37
  gvfs-goa 1.50.2-2.fc37 -> 1.50.3-1.fc37
  gvfs-gphoto2 1.50.2-2.fc37 -> 1.50.3-1.fc37
  gvfs-mtp 1.50.2-2.fc37 -> 1.50.3-1.fc37
  gvfs-smb 1.50.2-2.fc37 -> 1.50.3-1.fc37
  ibus 1.5.27-4.fc37 -> 1.5.27-5.fc37
  ibus-gtk3 1.5.27-4.fc37 -> 1.5.27-5.fc37
  ibus-gtk4 1.5.27-4.fc37 -> 1.5.27-5.fc37
  ibus-libs 1.5.27-4.fc37 -> 1.5.27-5.fc37
  ibus-setup 1.5.27-4.fc37 -> 1.5.27-5.fc37
  ibus-typing-booster 2.19.12-1.fc37 -> 2.19.13-2.fc37
  iptables-libs 1.8.8-3.fc37 -> 1.8.8-4.fc37
  iptables-nft 1.8.8-3.fc37 -> 1.8.8-4.fc37
  kernel 6.0.17-300.fc37 -> 6.1.6-200.fc37
  kernel-core 6.0.17-300.fc37 -> 6.1.6-200.fc37
  kernel-modules 6.0.17-300.fc37 -> 6.1.6-200.fc37
  kernel-modules-extra 6.0.17-300.fc37 -> 6.1.6-200.fc37
  kf5-filesystem 5.101.0-1.fc37 -> 5.102.0-1.fc37
  libXpm 3.5.13-8.fc37 -> 3.5.14-1.fc37
  libinput 1.22.0-2.fc37 -> 1.22.1-1.fc37
  libqmi 1.30.6-2.fc37 -> 1.30.8-1.fc37
  libqmi-utils 1.30.6-2.fc37 -> 1.30.8-1.fc37
  libsoup3 3.2.2-1.fc37 -> 3.2.2-2.fc37
  libwebp 1.2.4-2.fc37 -> 1.3.0-1.fc37
  llvm-libs 15.0.6-1.fc37 -> 15.0.7-1.fc37
  lz4-libs 1.9.3-5.fc37 -> 1.9.4-1.fc37
  mesa-dri-drivers 22.3.2-1.fc37 -> 22.3.3-1.fc37
  mesa-filesystem 22.3.2-1.fc37 -> 22.3.3-1.fc37
  mesa-libEGL 22.3.2-1.fc37 -> 22.3.3-1.fc37
  mesa-libGL 22.3.2-1.fc37 -> 22.3.3-1.fc37
  mesa-libgbm 22.3.2-1.fc37 -> 22.3.3-1.fc37
  mesa-libglapi 22.3.2-1.fc37 -> 22.3.3-1.fc37
  mesa-libxatracker 22.3.2-1.fc37 -> 22.3.3-1.fc37
  mesa-va-drivers 22.3.2-1.fc37 -> 22.3.3-1.fc37
  mesa-vulkan-drivers 22.3.2-1.fc37 -> 22.3.3-1.fc37
  mozjs102 102.6.0-1.fc37 -> 102.7.0-1.fc37
  mpg123-libs 1.31.1-1.fc37 -> 1.31.2-1.fc37
  nautilus 43.1-1.fc37 -> 43.2-1.fc37
  nautilus-extensions 43.1-1.fc37 -> 43.2-1.fc37
  nspr 4.35.0-2.fc37 -> 4.35.0-3.fc37
  nss 3.85.0-1.fc37 -> 3.87.0-1.fc37
  nss-softokn 3.85.0-1.fc37 -> 3.87.0-1.fc37
  nss-softokn-freebl 3.85.0-1.fc37 -> 3.87.0-1.fc37
  nss-sysinit 3.85.0-1.fc37 -> 3.87.0-1.fc37
  nss-util 3.85.0-1.fc37 -> 3.87.0-1.fc37
  orca 43.0-1.fc37 -> 43.1-1.fc37
  pipewire 0.3.63-1.fc37 -> 0.3.64-1.fc37
  pipewire-alsa 0.3.63-1.fc37 -> 0.3.64-1.fc37
  pipewire-gstreamer 0.3.63-1.fc37 -> 0.3.64-1.fc37
  pipewire-jack-audio-connection-kit 0.3.63-1.fc37 -> 0.3.64-1.fc37
  pipewire-libs 0.3.63-1.fc37 -> 0.3.64-1.fc37
  pipewire-pulseaudio 0.3.63-1.fc37 -> 0.3.64-1.fc37
  pipewire-utils 0.3.63-1.fc37 -> 0.3.64-1.fc37
  poppler 22.08.0-2.fc37 -> 22.08.0-3.fc37
  poppler-cpp 22.08.0-2.fc37 -> 22.08.0-3.fc37
  poppler-glib 22.08.0-2.fc37 -> 22.08.0-3.fc37
  poppler-utils 22.08.0-2.fc37 -> 22.08.0-3.fc37
  python-unversioned-command 3.11.1-1.fc37 -> 3.11.1-3.fc37
  python3 3.11.1-1.fc37 -> 3.11.1-3.fc37
  python3-libs 3.11.1-1.fc37 -> 3.11.1-3.fc37
  qgnomeplatform-qt5 0.9.0-5.fc37 -> 0.9.0-6.fc37
  qt5-qtbase 5.15.7-1.fc37 -> 5.15.8-2.fc37
  qt5-qtbase-common 5.15.7-1.fc37 -> 5.15.8-2.fc37
  qt5-qtbase-gui 5.15.7-1.fc37 -> 5.15.8-2.fc37
  qt5-qtdeclarative 5.15.7-1.fc37 -> 5.15.8-1.fc37
  qt5-qtwayland 5.15.7-1.fc37 -> 5.15.8-1.fc37
  qt5-qtx11extras 5.15.7-1.fc37 -> 5.15.8-1.fc37
  qt5-qtxmlpatterns 5.15.7-1.fc37 -> 5.15.8-1.fc37
  rav1e-libs 0.5.1-5.fc37 -> 0.5.1-6.fc37
  selinux-policy 37.17-1.fc37 -> 37.18-1.fc37
  selinux-policy-targeted 37.17-1.fc37 -> 37.18-1.fc37
  tree 2.0.2-2.fc37 -> 2.1.0-1.fc37
  unbound-anchor 1.17.0-1.fc37 -> 1.17.1-1.fc37
  unbound-libs 1.17.0-1.fc37 -> 1.17.1-1.fc37
  usbutils 014-3.fc37 -> 015-1.fc37
  vim-data 2:9.0.1054-1.fc37 -> 2:9.0.1182-1.fc37
  vim-minimal 2:9.0.1054-1.fc37 -> 2:9.0.1182-1.fc37
  xorg-x11-server-Xorg 1.20.14-12.fc37 -> 1.20.14-15.fc37
  xorg-x11-server-common 1.20.14-12.fc37 -> 1.20.14-15.fc37
Added:
  codec2-1.0.5-1.fc37.x86_64
  ilbc-3.0.4-3.fc37.x86_64
  intel-mediasdk-22.5.4-1.fc37.x86_64
  libavcodec-free-5.1.2-1.fc37.x86_64
  libavformat-free-5.1.2-1.fc37.x86_64
  libavutil-free-5.1.2-1.fc37.x86_64
  libchromaprint-1.5.1-5.fc37.x86_64
  libmodplug-1:0.8.9.0-15.fc37.x86_64
  libopenmpt-0.6.6-1.fc37.x86_64
  libsodium-1.0.18-10.fc37.x86_64
  libswresample-free-5.1.2-1.fc37.x86_64
  libvdpau-1.5-2.fc37.x86_64
  lpcnetfreedv-0.2-12.fc37.x86_64
  ocl-icd-2.3.1-2.fc37.x86_64
  openpgm-5.2.122-29.fc37.x86_64
  python3-langdetect-1.0.9-2.fc37.noarch
  srt-libs-1.5.1-1.fc37.x86_64
  vapoursynth-libs-58-3.fc37.x86_64
  zeromq-4.3.4-4.fc37.x86_64
  zimg-3.0.3-2.fc37.x86_64
Run "systemctl reboot" to start a reboot
Press Enter for changelog:
ostree diff commit from: booted deployment (81ad560ed850559259e46d5739e8d9ac8714fbcbbd0d24257a8934db7730edab)
ostree diff commit to:   pending deployment (6d2f91ba61bf5551eddb4ff94fa438af6e64fa6516ccb0495c1726331a555749)
Upgraded:
  ModemManager 1.18.8-2.fc37.x86_64 -> 1.18.12-1.fc37.x86_64
  ModemManager-glib 1.18.8-2.fc37.x86_64 -> 1.18.12-1.fc37.x86_64
    * Tue Jan 10 2023 Lubomir Rintel <lkundrak@v3.sk> - 1.18.12-1
    - Update to 1.18.12

  NetworkManager 1:1.40.6-1.fc37.x86_64 -> 1:1.40.10-1.fc37.x86_64
  NetworkManager-adsl 1:1.40.6-1.fc37.x86_64 -> 1:1.40.10-1.fc37.x86_64
  NetworkManager-bluetooth 1:1.40.6-1.fc37.x86_64 -> 1:1.40.10-1.fc37.x86_64
  NetworkManager-config-connectivity-fedora 1:1.40.6-1.fc37.noarch -> 1:1.40.10-1.fc37.noarch
  NetworkManager-libnm 1:1.40.6-1.fc37.x86_64 -> 1:1.40.10-1.fc37.x86_64
  NetworkManager-ppp 1:1.40.6-1.fc37.x86_64 -> 1:1.40.10-1.fc37.x86_64
  NetworkManager-wifi 1:1.40.6-1.fc37.x86_64 -> 1:1.40.10-1.fc37.x86_64
  NetworkManager-wwan 1:1.40.6-1.fc37.x86_64 -> 1:1.40.10-1.fc37.x86_64
    * Mon Jan 16 2023 Beniamino Galvani <bgalvani@redhat.com> - 1:1.40.10-1
    - Update to 1.40.10 release.

  alsa-sof-firmware 2.2.3-1.fc37.noarch -> 2.2.4-2.fc37.noarch
    * Mon Jan 09 2023 Jaroslav Kysela <perex@perex.cz> - 2.2.4-2
    - Update to v2.2.4

  chromium 107.0.5304.121-1.fc37.x86_64 -> 109.0.5414.74-1.fc37.x86_64
  chromium-common 107.0.5304.121-1.fc37.x86_64 -> 109.0.5414.74-1.fc37.x86_64
    * Wed Jan 11 2023 Than Ngo <than@redhat.com> - 109.0.5414.74-1
    - update to 109.0.5414.74

    * Tue Jan 10 2023 Than Ngo <than@redhat.com> - 108.0.5359.124-5
    - enable qt backend for el >= 9 and fedora >= 35
    - drop i686
    - conditional BR on java-1.8.0-openjdk-headless

    * Sun Jan 08 2023 Than Ngo <than@redhat.com> - 108.0.5359.124-4
    - vaapi support for wayland

    * Wed Jan 04 2023 Than Ngo <than@redhat.com> - 108.0.5359.124-3
    - build with system ffmpeg-free and system libaom
    - fix widewine extension issue
    - vaapi, disable UseChromeOSDirectVideoDecoder
    - workaround for linking issue in clang <= 14

    * Sun Jan 01 2023 Tom Callaway <spot@fedoraproject.org> - 108.0.5359.124-2
    - turn headless back on (chrome-remote-desktop will stay off, probably forever)

    * Wed Dec 28 2022 Than Ngo <than@redhat.com> - 108.0.5359.124-1
    - update to 108.0.5359.124
    - switch to clang

  container-selinux 2:2.195.1-1.fc37.noarch -> 2:2.198.0-1.fc37.noarch
    * Fri Jan 06 2023 Lokesh Mandvekar <lsm5@fedoraproject.org> 2:2.198.0-1
    - bump to v2.198.0

    * Wed Jan 04 2023 Lokesh Mandvekar <lsm5@fedoraproject.org> 2:2.197.0-1
    - bump to v2.197.0

  distribution-gpg-keys 1.80-1.fc37.noarch -> 1.81-1.fc37.noarch
    * Fri Jan 06 2023 Miroslav Suchý <msuchy@redhat.com> 1.81-1
    - update copr keys
    - Add remi 2023 key
    - add TeamViewer key

  efivar-libs 38-5.fc37.x86_64 -> 38-6.fc37.x86_64
    * Tue Jan 10 2023 Robbie Harwood <rharwood@redhat.com> - 38-6
    - Fix inheritance of buildflags

  emoji-picker 2.19.12-1.fc37.noarch -> 2.19.13-2.fc37.noarch
    * Sun Jan 08 2023 Mike FABIAN <mfabian@redhat.com> - 2.19.13-2
    - Update tarball to version with corrected changelog upstream

    * Fri Dec 30 2022 Mike FABIAN <mfabian@redhat.com> - 2.19.13-1
    - Update to 2.19.13
    - Catch exception when user database is locked during shutdown
      (Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=215144)

  firefox 108.0.1-3.fc37.x86_64 -> 109.0-1.fc37.x86_64
    * Mon Jan 16 2023 Martin Stransky <stransky@redhat.com>- 109.0-1
    - Update to 109.0

    * Thu Jan 12 2023 Jan Horak <jhorak@redhat.com> - 108.0.2-1
    - Update to 108.0.2

    * Mon Jan 09 2023 Kalev Lember <klember@redhat.com> - 108.0.1-4
    - Drop conditionals for F35

  flatpak 1.14.1-1.fc37.x86_64 -> 1.14.1-2.fc37.x86_64
  flatpak-libs 1.14.1-1.fc37.x86_64 -> 1.14.1-2.fc37.x86_64
  flatpak-selinux 1.14.1-1.fc37.noarch -> 1.14.1-2.fc37.noarch
  flatpak-session-helper 1.14.1-1.fc37.x86_64 -> 1.14.1-2.fc37.x86_64
    * Fri Jan 06 2023 David King <amigadave@amigadave.com> - 1.14.1-2
    - Require fusermount (#2158474)

  git-core 2.39.0-1.fc37.x86_64 -> 2.39.1-1.fc37.x86_64
  git-core-doc 2.39.0-1.fc37.noarch -> 2.39.1-1.fc37.noarch
    * Tue Jan 17 2023 Todd Zullinger <tmz@pobox.com> - 2.39.1-1
    - update to 2.39.1 (CVE-2022-41903, CVE-2022-23521)

  gjs 1.74.1-3.fc37.x86_64 -> 1.74.1-5.fc37.x86_64
    * Mon Jan 16 2023 Frantisek Zatloukal <fzatlouk@redhat.com> - 1.74.1-5
    - Pull in mesa-dri-drivers and dbus-x11 to fix the testsuite

    * Mon Jan 16 2023 Frantisek Zatloukal <fzatlouk@redhat.com> - 1.74.1-4
    - Rebuild against mozjs102-102.7.0-1

  glibc 2.36-8.fc37.x86_64 -> 2.36-9.fc37.x86_64
  glibc-all-langpacks 2.36-8.fc37.x86_64 -> 2.36-9.fc37.x86_64
  glibc-common 2.36-8.fc37.x86_64 -> 2.36-9.fc37.x86_64
  glibc-gconv-extra 2.36-8.fc37.x86_64 -> 2.36-9.fc37.x86_64
    * Tue Jan 10 2023 Carlos O'Donell <carlos@redhat.com> - 2.36-9
    - Auto-sync with upstream branch release/2.36/master,
      commit e05036b194559cbfcdfcfb1b920d37b939e3e35c:
    - time: Set daylight to 1 for matching DST/offset change (bug 29951)
    - elf/tst-tlsopt-powerpc fails when compiled with -mcpu=power10 (BZ# 29776)
    - x86: Fix -Os build (BZ #29576)
    - sunrpc: Suppress GCC -Os warning on user2netname
    - locale: prevent maybe-uninitialized errors with -Os [BZ #19444]
    - time: Use 64 bit time on tzfile
    - nscd: Use 64 bit time_t on libc nscd routines (BZ# 29402)
    - nis: Build libnsl with 64 bit time_t
    - Apply asm redirections in syslog.h before first use [BZ #27087]
    - x86: Fix wcsnlen-avx2 page cross length comparison [BZ #29591]
    - elf: Fix rtld-audit trampoline for aarch64

  gnome-software 43.2-1.fc37.x86_64 -> 43.3-1.fc37.x86_64
  gnome-software-rpm-ostree 43.2-1.fc37.x86_64 -> 43.3-1.fc37.x86_64
    * Mon Jan 09 2023 Milan Crha <mcrha@redhat.com> - 43.3-1
    - Update to 43.3

  grub2-common 1:2.06-72.fc37.noarch -> 1:2.06-75.fc37.noarch
  grub2-efi-ia32 1:2.06-72.fc37.x86_64 -> 1:2.06-75.fc37.x86_64
  grub2-efi-x64 1:2.06-72.fc37.x86_64 -> 1:2.06-75.fc37.x86_64
  grub2-pc 1:2.06-72.fc37.x86_64 -> 1:2.06-75.fc37.x86_64
  grub2-pc-modules 1:2.06-72.fc37.noarch -> 1:2.06-75.fc37.noarch
  grub2-tools 1:2.06-72.fc37.x86_64 -> 1:2.06-75.fc37.x86_64
  grub2-tools-minimal 1:2.06-72.fc37.x86_64 -> 1:2.06-75.fc37.x86_64
    * Wed Jan 11 2023 Robbie Harwood <rharwood@redhat.com> - 2.06-75
    - Pull allocator improvements from upstream

    * Wed Jan 11 2023 Robbie Harwood <rharwood@redhat.com> - 2.06-74
    - Apply more hardening to host binaries

    * Tue Jan 10 2023 Robbie Harwood <rharwood@redhat.com> - 2.06-73
    - Allow internal grub allocations over 4GB

  gst-editing-services 1.20.4-1.fc37.x86_64 -> 1.20.5-1.fc37.x86_64
    * Wed Jan 11 2023 Wim Taymans <wtaymans@redhat.com> - 1.20.5-1
    - Update to 1.20.5

  gstreamer1 1.20.4-1.fc37.x86_64 -> 1.20.5-1.fc37.x86_64
    * Wed Jan 11 2023 Wim Taymans <wtaymans@redhat.com> - 1.20.5-1
    - Update to 1.20.5

  gstreamer1-plugins-bad-free 1.20.4-1.fc37.x86_64 -> 1.20.5-1.fc37.x86_64
    * Wed Jan 11 2023 Wim Taymans <wtaymans@redhat.com> - 1.20.5-1
    - Update to 1.20.5

  gstreamer1-plugins-base 1.20.4-1.fc37.x86_64 -> 1.20.5-1.fc37.x86_64
    * Wed Jan 11 2023 Wim Taymans <wtaymans@redhat.com> - 1.20.5-1
    - Update to 1.20.5

  gstreamer1-plugins-good 1.20.4-1.fc37.x86_64 -> 1.20.5-1.fc37.x86_64
  gstreamer1-plugins-good-qt 1.20.4-1.fc37.x86_64 -> 1.20.5-1.fc37.x86_64
    * Wed Jan 11 2023 Wim Taymans <wtaymans@redhat.com> - 1.20.5-1
    - Update to 1.20.5

  gstreamer1-plugins-ugly-free 1.20.4-1.fc37.x86_64 -> 1.20.5-1.fc37.x86_64
    * Wed Jan 11 2023 Wim Taymans <wtaymans@redhat.com> - 1.20.5-1
    - Update to 1.20.5

  gtk4 4.8.2-2.fc37.x86_64 -> 4.8.3-1.fc37.x86_64
    * Sun Jan 08 2023 David King <amigadave@amigadave.com> - 4.8.3-1
    - Update to 4.8.3 (#2158999)

  gvfs 1.50.2-2.fc37.x86_64 -> 1.50.3-1.fc37.x86_64
  gvfs-afc 1.50.2-2.fc37.x86_64 -> 1.50.3-1.fc37.x86_64
  gvfs-afp 1.50.2-2.fc37.x86_64 -> 1.50.3-1.fc37.x86_64
  gvfs-archive 1.50.2-2.fc37.x86_64 -> 1.50.3-1.fc37.x86_64
  gvfs-client 1.50.2-2.fc37.x86_64 -> 1.50.3-1.fc37.x86_64
  gvfs-fuse 1.50.2-2.fc37.x86_64 -> 1.50.3-1.fc37.x86_64
  gvfs-goa 1.50.2-2.fc37.x86_64 -> 1.50.3-1.fc37.x86_64
  gvfs-gphoto2 1.50.2-2.fc37.x86_64 -> 1.50.3-1.fc37.x86_64
  gvfs-mtp 1.50.2-2.fc37.x86_64 -> 1.50.3-1.fc37.x86_64
  gvfs-smb 1.50.2-2.fc37.x86_64 -> 1.50.3-1.fc37.x86_64
    * Sun Jan 08 2023 David King <amigadave@amigadave.com> - 1.50.3-1
    - Update to 1.50.3

  ibus 1.5.27-4.fc37.x86_64 -> 1.5.27-5.fc37.x86_64
  ibus-gtk3 1.5.27-4.fc37.x86_64 -> 1.5.27-5.fc37.x86_64
  ibus-gtk4 1.5.27-4.fc37.x86_64 -> 1.5.27-5.fc37.x86_64
  ibus-libs 1.5.27-4.fc37.x86_64 -> 1.5.27-5.fc37.x86_64
  ibus-setup 1.5.27-4.fc37.noarch -> 1.5.27-5.fc37.noarch
    * Thu Jan 12 2023 Takao Fujiwara <tfujiwar@redhat.com> - 1.5.27-5
    - Refactor surrounding text warning

  ibus-typing-booster 2.19.12-1.fc37.noarch -> 2.19.13-2.fc37.noarch
    * Sun Jan 08 2023 Mike FABIAN <mfabian@redhat.com> - 2.19.13-2
    - Update tarball to version with corrected changelog upstream

    * Fri Dec 30 2022 Mike FABIAN <mfabian@redhat.com> - 2.19.13-1
    - Update to 2.19.13
    - Catch exception when user database is locked during shutdown
      (Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=215144)

  iptables-libs 1.8.8-3.fc37.x86_64 -> 1.8.8-4.fc37.x86_64
  iptables-nft 1.8.8-3.fc37.x86_64 -> 1.8.8-4.fc37.x86_64
    * Thu Jan 12 2023 Phil Sutter <psutter@redhat.com> - 1.8.8-4
    - Make iptables-xml a relative symlink
    - Add fixes from upstream

  kernel 6.0.17-300.fc37.x86_64 -> 6.1.6-200.fc37.x86_64
  kernel-core 6.0.17-300.fc37.x86_64 -> 6.1.6-200.fc37.x86_64
  kernel-modules 6.0.17-300.fc37.x86_64 -> 6.1.6-200.fc37.x86_64
  kernel-modules-extra 6.0.17-300.fc37.x86_64 -> 6.1.6-200.fc37.x86_64
    * Sat Jan 14 2023 Justin M. Forbes <jforbes@fedoraproject.org> [6.1.6-0]
    - Linux v6.1.6

    * Thu Jan 12 2023 Justin M. Forbes <jforbes@fedoraproject.org> [6.1.5-0]
    - KVM: VMX: Execute IBPB on emulated VM-exit when guest has IBRS (Jim Mattson)
    - Update module filters for nvmem_u-boot-env (Justin M. Forbes)
    - drivers/firmware: skip simpledrm if nvidia-drm.modeset=1 is set (Javier Martinez Canillas)
    - fedora: Updates for 6.1 merge (Peter Robinson)
    - Linux v6.1.5

    * Sat Jan 07 2023 Justin M. Forbes <jforbes@fedoraproject.org> [6.1.4-0]
    - brcmfmac: Prefer DT board type over DMI board type (Ivan T. Ivanov)
    - Remove the revert patch from F36, as a new pahole is being pushed to stable making it unnecessary (Justin M. Forbes)
    - Linux v6.1.4

    * Wed Jan 04 2023 Justin M. Forbes <jforbes@fedoraproject.org> [6.1.3-0]
    - Linux v6.1.3

  kf5-filesystem 5.101.0-1.fc37.x86_64 -> 5.102.0-1.fc37.x86_64
    * Sat Jan 14 2023 Marc Deop <marcdeop@fedoraproject.org> - 5.102.0-1
    - 5.102.0

  libXpm 3.5.13-8.fc37.x86_64 -> 3.5.14-1.fc37.x86_64
    * Wed Jan 11 2023 Peter Hutterer <peter.hutterer@redhat.com> - 3.5.14-1
    - libXpm 3.5.14

  libinput 1.22.0-2.fc37.x86_64 -> 1.22.1-1.fc37.x86_64
    * Mon Jan 16 2023 Peter Hutterer <peter.hutterer@redhat.com> - 1.22.1-1
    - libinput 1.22.1

  libqmi 1.30.6-2.fc37.x86_64 -> 1.30.8-1.fc37.x86_64
  libqmi-utils 1.30.6-2.fc37.x86_64 -> 1.30.8-1.fc37.x86_64
    * Tue Jan 10 2023 Lubomir Rintel <lkundrak@v3.sk> - 1.30.8-1
    - Update to 1.30.8

  libsoup3 3.2.2-1.fc37.x86_64 -> 3.2.2-2.fc37.x86_64
    * Mon Jan 16 2023 Michael Catanzaro <mcatanzaro@redhat.com> - 3.2.2-2
    - Rebuild against latest nghttp2

    * Thu Nov 03 2022 David King <amigadave@amigadave.com> - 3.2.2-1
    - Update to 3.2.2

  libwebp 1.2.4-2.fc37.x86_64 -> 1.3.0-1.fc37.x86_64
    * Fri Jan 13 2023 Sandro Mani <manisandro@gmail.com> - 1.3.0-1
    - Update to 1.3.0

  llvm-libs 15.0.6-1.fc37.x86_64 -> 15.0.7-1.fc37.x86_64
    * Thu Jan 12 2023 Nikita Popov <npopov@redhat.com> - 15.0.7-1
    - Update to LLVM 15.0.7

  lz4-libs 1.9.3-5.fc37.x86_64 -> 1.9.4-1.fc37.x86_64
    * Wed Aug 17 2022 Timothée Ravier <tim@siosm.fr> - 1.9.4-1
    - Update to 1.9.4 (fedora#2118499)

  mesa-dri-drivers 22.3.2-1.fc37.x86_64 -> 22.3.3-1.fc37.x86_64
  mesa-filesystem 22.3.2-1.fc37.x86_64 -> 22.3.3-1.fc37.x86_64
  mesa-libEGL 22.3.2-1.fc37.x86_64 -> 22.3.3-1.fc37.x86_64
  mesa-libGL 22.3.2-1.fc37.x86_64 -> 22.3.3-1.fc37.x86_64
  mesa-libgbm 22.3.2-1.fc37.x86_64 -> 22.3.3-1.fc37.x86_64
  mesa-libglapi 22.3.2-1.fc37.x86_64 -> 22.3.3-1.fc37.x86_64
  mesa-libxatracker 22.3.2-1.fc37.x86_64 -> 22.3.3-1.fc37.x86_64
  mesa-va-drivers 22.3.2-1.fc37.x86_64 -> 22.3.3-1.fc37.x86_64
  mesa-vulkan-drivers 22.3.2-1.fc37.x86_64 -> 22.3.3-1.fc37.x86_64
    * Wed Jan 11 2023 Pete Walter <pwalter@fedoraproject.org> 22.3.3-1
    - Update to 22.3.3

  mozjs102 102.6.0-1.fc37.x86_64 -> 102.7.0-1.fc37.x86_64
    * Mon Jan 16 2023 Frantisek Zatloukal <fzatlouk@redhat.com> - 102.7.0-1
    - mozjs102-102.7.0 (fixes RHBZ#2161250)

    * Sat Dec 31 2022 Pete Walter <pwalter@fedoraproject.org> - 102.6.0-2
    - Rebuild for ICU 72

  mpg123-libs 1.31.1-1.fc37.x86_64 -> 1.31.2-1.fc37.x86_64
    * Sun Jan 15 2023 Phil Wyett <philip.wyett@kathenas.org> - 1.31.2-1
    - Update to 1.31.2

    * Sun Nov 13 2022 Mamoru TASAKA <mtasaka@fedoraproject.org> - 1.31.1-3
    - Revert the previous change for now

    * Fri Nov 11 2022 Phil Wyett <philip.wyett@kathenas.org> - 1.31.1-2
    - Use --disable-largefile and allow co-installable arch devel packages

  nautilus 43.1-1.fc37.x86_64 -> 43.2-1.fc37.x86_64
  nautilus-extensions 43.1-1.fc37.x86_64 -> 43.2-1.fc37.x86_64
    * Sun Jan 08 2023 David King <amigadave@amigadave.com> - 43.2-1
    - Update to 43.2

  nspr 4.35.0-2.fc37.x86_64 -> 4.35.0-3.fc37.x86_64
  nss 3.85.0-1.fc37.x86_64 -> 3.87.0-1.fc37.x86_64
  nss-softokn 3.85.0-1.fc37.x86_64 -> 3.87.0-1.fc37.x86_64
  nss-softokn-freebl 3.85.0-1.fc37.x86_64 -> 3.87.0-1.fc37.x86_64
  nss-sysinit 3.85.0-1.fc37.x86_64 -> 3.87.0-1.fc37.x86_64
  nss-util 3.85.0-1.fc37.x86_64 -> 3.87.0-1.fc37.x86_64
    * Tue Jan 10 2023 Frantisek Krenzelok <krenzelok.frantisek@gmail.com> - 3.87.0-1
    - Update NSS to 3.87 & remove unused patches

  orca 43.0-1.fc37.noarch -> 43.1-1.fc37.noarch
    * Thu Jan 05 2023 David King <amigadave@amigadave.com> - 43.1-1
    - Update to 43.1

  pipewire 0.3.63-1.fc37.x86_64 -> 0.3.64-1.fc37.x86_64
  pipewire-alsa 0.3.63-1.fc37.x86_64 -> 0.3.64-1.fc37.x86_64
  pipewire-gstreamer 0.3.63-1.fc37.x86_64 -> 0.3.64-1.fc37.x86_64
  pipewire-jack-audio-connection-kit 0.3.63-1.fc37.x86_64 -> 0.3.64-1.fc37.x86_64
  pipewire-libs 0.3.63-1.fc37.x86_64 -> 0.3.64-1.fc37.x86_64
  pipewire-pulseaudio 0.3.63-1.fc37.x86_64 -> 0.3.64-1.fc37.x86_64
  pipewire-utils 0.3.63-1.fc37.x86_64 -> 0.3.64-1.fc37.x86_64
    * Thu Jan 12 2023 Wim Taymans <wtaymans@redhat.com> - 0.3.64-1
    - Update version to 0.3.64

  poppler 22.08.0-2.fc37.x86_64 -> 22.08.0-3.fc37.x86_64
  poppler-cpp 22.08.0-2.fc37.x86_64 -> 22.08.0-3.fc37.x86_64
  poppler-glib 22.08.0-2.fc37.x86_64 -> 22.08.0-3.fc37.x86_64
  poppler-utils 22.08.0-2.fc37.x86_64 -> 22.08.0-3.fc37.x86_64
    * Wed Jan 11 2023 Marek Kasik <mkasik@redhat.com> - 22.08.0-3
    - Update font after restore in Cairo
    - Provide Unicode marker when ensuring fonts

  python-unversioned-command 3.11.1-1.fc37.noarch -> 3.11.1-3.fc37.noarch
  python3 3.11.1-1.fc37.x86_64 -> 3.11.1-3.fc37.x86_64
  python3-libs 3.11.1-1.fc37.x86_64 -> 3.11.1-3.fc37.x86_64
    * Fri Jan 06 2023 Miro Hrončok <mhroncok@redhat.com> - 3.11.1-3
    - Fix `asyncio` subprocess losing `stderr` and `stdout` output
    - Remove any deprecation warnings in asyncio.get_event_loop()

  qgnomeplatform-qt5 0.9.0-5.fc37.x86_64 -> 0.9.0-6.fc37.x86_64
    * Fri Jan 06 2023 Jan Grulich <jgrulich@redhat.com> - 0.9.0-6
    - Rebuild (qt5)

  qt5-qtbase 5.15.7-1.fc37.x86_64 -> 5.15.8-2.fc37.x86_64
  qt5-qtbase-common 5.15.7-1.fc37.noarch -> 5.15.8-2.fc37.noarch
  qt5-qtbase-gui 5.15.7-1.fc37.x86_64 -> 5.15.8-2.fc37.x86_64
    * Thu Jan 05 2023 Jan Grulich <jgrulich@redhat.com> - 5.15.8-2
    - Correctly install qtsan header file

    * Thu Jan 05 2023 Jan Grulich <jgrulich@redhat.com> - 5.15.8-1
    - 5.15.8

    * Sat Dec 31 2022 Pete Walter <pwalter@fedoraproject.org> - 5.15.7-2
    - Rebuild for ICU 72

  qt5-qtdeclarative 5.15.7-1.fc37.x86_64 -> 5.15.8-1.fc37.x86_64
    * Thu Jan 05 2023 Jan Grulich <jgrulich@redhat.com> - 5.15.8-1
    - 5.15.8

  qt5-qtwayland 5.15.7-1.fc37.x86_64 -> 5.15.8-1.fc37.x86_64
    * Thu Jan 05 2023 Jan Grulich <jgrulich@redhat.com> - 5.15.8-1
    - 5.15.8

  qt5-qtx11extras 5.15.7-1.fc37.x86_64 -> 5.15.8-1.fc37.x86_64
    * Thu Jan 05 2023 Jan Grulich <jgrulich@redhat.com> - 5.15.8-1
    - 5.15.8

  qt5-qtxmlpatterns 5.15.7-1.fc37.x86_64 -> 5.15.8-1.fc37.x86_64
    * Thu Jan 05 2023 Jan Grulich <jgrulich@redhat.com> - 5.15.8-1
    - 5.15.8

  rav1e-libs 0.5.1-5.fc37.x86_64 -> 0.5.1-6.fc37.x86_64
    * Fri Jan 13 2023 Fabio Valentini <decathorpe@gmail.com> 0.5.1-6
    - Backport upstream patch to fix UB / crash in test code

  selinux-policy 37.17-1.fc37.noarch -> 37.18-1.fc37.noarch
  selinux-policy-targeted 37.17-1.fc37.noarch -> 37.18-1.fc37.noarch
    * Mon Jan 16 2023 Zdenek Pytela <zpytela@redhat.com> - 37.18-1
    - Allow apcupsd dbus chat with systemd-logind
    - Allow nut_domain manage also files and sock_files in /var/run
    - Label /usr/lib/rpm/rpmdb_migrate with rpmdb_exec_t
    - Allow tlp read generic SSL certificates
    - Allow systemd-resolved watch tmpfs directories
    - Revert "Allow systemd-resolved watch tmpfs directories"
    - Allow stalld to read /sys/kernel/security/lockdown file

  tree 2.0.2-2.fc37.x86_64 -> 2.1.0-1.fc37.x86_64
    * Wed Dec 28 2022 Kamil Dudka <kdudka@redhat.com> - 2.1.0-1
    - update to the latest upstream release

    * Wed Sep 07 2022 Kamil Dudka <kdudka@redhat.com> - 2.0.4-1
    - update to the latest upstream release

  unbound-anchor 1.17.0-1.fc37.x86_64 -> 1.17.1-1.fc37.x86_64
  unbound-libs 1.17.0-1.fc37.x86_64 -> 1.17.1-1.fc37.x86_64
    * Fri Jan 13 2023 Paul Wouters <paul.wouters@aiven.io - 1.17.1-1
    - Resolved rhbz#2160397 unbound-1.17.1 is available (bugfix release)
    - Add support for building with redis

    * Thu Dec 01 2022 Petr Menšík <pemensik@redhat.com> - 1.17.0-2
    - Move unbound user creation to libs (#2149036)
    - Use systemd-sysusers for user creation (#2105416)
    - Keep original DNSSEC root key as config (#2132103)

  usbutils 014-3.fc37.x86_64 -> 015-1.fc37.x86_64
    * Fri Jan 13 2023 Jan Macku <jamacku@redhat.com> - 015-1
    - Update to 015

  vim-data 2:9.0.1054-1.fc37.noarch -> 2:9.0.1182-1.fc37.noarch
  vim-minimal 2:9.0.1054-1.fc37.x86_64 -> 2:9.0.1182-1.fc37.x86_64
    * Thu Jan 12 2023 Zdenek Dohnal <zdohnal@redhat.com> - 2:9.0.1182-1
    - patchlevel 1182

    * Mon Jan 09 2023 Zdenek Dohnal <zdohnal@redhat.com> - 2:9.0.1160-1
    - patchlevel 1160

    * Mon Jan 09 2023 Zdenek Dohnal <zdohnal@redhat.com> - 2:9.0.1054-2
    - FTBFS with new FORTIFY_SOURCE=3 - remove it since Vim wants level 1

  xorg-x11-server-Xorg 1.20.14-12.fc37.x86_64 -> 1.20.14-15.fc37.x86_64
  xorg-x11-server-common 1.20.14-12.fc37.x86_64 -> 1.20.14-15.fc37.x86_64
    * Fri Jan 13 2023 Leif Liddy <leifliddy@fedoraproject.org> 1.20.14-15
    - Xorg server does not correctly select the DCP for the display
      without a quirk on Apple silicon machines (#2152414)

    * Fri Jan 13 2023 Peter Hutterer <peter.hutterer@redhat.com> - 1.20.14-14
    - Disallow byte-swapped clients (#2159489)

    * Wed Jan 11 2023 Olivier Fourdan <ofourdan@redhat.com> - 1.20.14-13
    - Rename boolean config value field from bool to boolean to fix drivers
      build failures due to a conflict with C++ and stdbool.h

Added:
  codec2-1.0.5-1.fc37.x86_64
  ilbc-3.0.4-3.fc37.x86_64
  intel-mediasdk-22.5.4-1.fc37.x86_64
  libavcodec-free-5.1.2-1.fc37.x86_64
  libavformat-free-5.1.2-1.fc37.x86_64
  libavutil-free-5.1.2-1.fc37.x86_64
  libchromaprint-1.5.1-5.fc37.x86_64
  libmodplug-1:0.8.9.0-15.fc37.x86_64
  libopenmpt-0.6.6-1.fc37.x86_64
  libsodium-1.0.18-10.fc37.x86_64
  libswresample-free-5.1.2-1.fc37.x86_64
  libvdpau-1.5-2.fc37.x86_64
  lpcnetfreedv-0.2-12.fc37.x86_64
  ocl-icd-2.3.1-2.fc37.x86_64
  openpgm-5.2.122-29.fc37.x86_64
  python3-langdetect-1.0.9-2.fc37.noarch
  srt-libs-1.5.1-1.fc37.x86_64
  vapoursynth-libs-58-3.fc37.x86_64
  zeromq-4.3.4-4.fc37.x86_64
  zimg-3.0.3-2.fc37.x86_64

Changes since last rpm-ostree update:
--- /var/home/petersen/.cache/rpmostree-updates/previous-changelog	2023-01-20 13:39:19.301138183 +0800
+++ /var/home/petersen/.cache/rpmostree-updates/latest-changelog	2023-01-21 16:56:24.594407846 +0800
@@ -2 +2 @@
-ostree diff commit to:   pending deployment (fa853a038585cdc8bf2ae7535cf0c1ac6f1ed60b6d39425f8161da24ec777408)
+ostree diff commit to:   pending deployment (6d2f91ba61bf5551eddb4ff94fa438af6e64fa6516ccb0495c1726331a555749)
@@ -24,2 +24,13 @@
-  chromium 107.0.5304.121-1.fc37.x86_64 -> 108.0.5359.124-3.fc37.x86_64
-  chromium-common 107.0.5304.121-1.fc37.x86_64 -> 108.0.5359.124-3.fc37.x86_64
+  chromium 107.0.5304.121-1.fc37.x86_64 -> 109.0.5414.74-1.fc37.x86_64
+  chromium-common 107.0.5304.121-1.fc37.x86_64 -> 109.0.5414.74-1.fc37.x86_64
+    * Wed Jan 11 2023 Than Ngo <than@redhat.com> - 109.0.5414.74-1
+    - update to 109.0.5414.74
+
+    * Tue Jan 10 2023 Than Ngo <than@redhat.com> - 108.0.5359.124-5
+    - enable qt backend for el >= 9 and fedora >= 35
+    - drop i686
+    - conditional BR on java-1.8.0-openjdk-headless
+
+    * Sun Jan 08 2023 Than Ngo <than@redhat.com> - 108.0.5359.124-4
+    - vaapi support for wayland
+
@@ -80,0 +92,5 @@
+
+  git-core 2.39.0-1.fc37.x86_64 -> 2.39.1-1.fc37.x86_64
+  git-core-doc 2.39.0-1.fc37.noarch -> 2.39.1-1.fc37.noarch
+    * Tue Jan 17 2023 Todd Zullinger <tmz@pobox.com> - 2.39.1-1
+    - update to 2.39.1 (CVE-2022-41903, CVE-2022-23521)

```

## Installation

`stack install` or `cabal install`

## Contributions

Feedback, suggestions, and patches welcome.

This might eventually get renamed to something like rpmostree-tool,
rpmostree-wrapper or even rpmost... if it should gain more command features.
