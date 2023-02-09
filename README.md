# rpmostree-update

Wrapper of `rpm-ostree update` that compares previous update output.
Also outputs changelog with diff.

Still experimental

## Usage

```shellsession
$ rpmostree-update
Preview:
2 metadata, 0 content objects fetched; 53 KiB transferred in 8 seconds; 0 bytes content written
Enabled rpm-md repositories: fedora-cisco-openh264 updates fedora updates-archive
Updating metadata for 'fedora-cisco-openh264'...done
Updating metadata for 'updates'...done
Updating metadata for 'fedora'...done
Updating metadata for 'updates-archive'...done
Importing rpm-md...done
rpm-md repo 'fedora-cisco-openh264'; generated: 2022-10-06T11:01:40Z solvables: 4
rpm-md repo 'updates'; generated: 2023-02-09T08:58:55Z solvables: 18329
rpm-md repo 'fedora'; generated: 2022-11-05T08:04:38Z solvables: 66822
rpm-md repo 'updates-archive'; generated: 2023-02-09T09:27:37Z solvables: 23277
Note: --check and --preview may be unreliable.  See https://github.com/coreos/rpm-ostree/issues/1579
AvailableUpdate:
        Version: 37.20230209.0 (2023-02-09T00:46:24Z)
         Commit: 319016f4e0ab3078cec37752128ff431bd77e3e71a122a5586df46b79097f050
   GPGSignature: 1 signature
                 Signature made Thu 09 Feb 2023 04:54:27 PM using RSA key ID F55AD3FB5323552A
                 Good signature from "Fedora <fedora-37-primary@fedoraproject.org>"
  SecAdvisories: FEDORA-2023-fd4786cc83  Unknown    chromium-109.0.5414.119-1.fc37.x86_64
                 FEDORA-2023-fd4786cc83  Unknown    chromium-common-109.0.5414.119-1.fc37.x86_64
                   CVE-2023-0471 CVE-2023-0472 CVE-2023-0473 CVE-2023-0474 chromium: various flaws [fedora-all]
                   https://bugzilla.redhat.com/show_bug.cgi?id=2164336
                 FEDORA-2023-25617e952a  Moderate   tpm2-tss-3.2.2-1.fc37.x86_64
                   CVE-2023-22745 tpm2-tss: Buffer Overlow in TSS2_RC_Decode [fedora-all]
                   https://bugzilla.redhat.com/show_bug.cgi?id=2162612
                 FEDORA-2023-4006357f7e  Moderate   kernel-6.1.9-200.fc37.x86_64
                 FEDORA-2023-4006357f7e  Moderate   kernel-core-6.1.9-200.fc37.x86_64
                 FEDORA-2023-4006357f7e  Moderate   kernel-modules-6.1.9-200.fc37.x86_64
                 FEDORA-2023-4006357f7e  Moderate   kernel-modules-extra-6.1.9-200.fc37.x86_64
                   CVE-2023-0597 kernel: x86/mm: Randomize per-cpu entry area
                   https://bugzilla.redhat.com/show_bug.cgi?id=2165926
                 FEDORA-2023-5210df1dd1  Moderate   javascriptcoregtk4.1-2.38.4-1.fc37.x86_64
                 FEDORA-2023-5210df1dd1  Moderate   javascriptcoregtk5.0-2.38.4-1.fc37.x86_64
                 FEDORA-2023-5210df1dd1  Moderate   webkit2gtk4.1-2.38.4-1.fc37.x86_64
                 FEDORA-2023-5210df1dd1  Moderate   webkit2gtk5.0-2.38.4-1.fc37.x86_64
       Upgraded: SDL2 2.26.0-1.fc37 -> 2.26.2-1.fc37
                 buildah 1.28.0-6.fc37 -> 1.29.0-1.fc37
                 chromium 109.0.5414.74-1.fc37 -> 109.0.5414.119-1.fc37
                 chromium-common 109.0.5414.74-1.fc37 -> 109.0.5414.119-1.fc37
                 cifs-utils 6.15-2.fc37 -> 7.0-1.fc37
                 cifs-utils-info 6.15-2.fc37 -> 7.0-1.fc37
                 container-selinux 2:2.198.0-1.fc37 -> 2:2.199.0-1.fc37
                 containers-common 4:1-76.fc37 -> 4:1-78.fc37
                 containers-common-extra 4:1-76.fc37 -> 4:1-78.fc37
                 dbus-broker 32-1.fc37 -> 33-1.fc37
                 distribution-gpg-keys 1.81-1.fc37 -> 1.82-1.fc37
                 evolution-data-server 3.46.3-1.fc37 -> 3.46.3-2.fc37
                 evolution-data-server-langpacks 3.46.3-1.fc37 -> 3.46.3-2.fc37
                 exiv2 0.27.5-3.fc37 -> 0.27.6-4.fc37
                 exiv2-libs 0.27.5-3.fc37 -> 0.27.6-4.fc37
                 fedora-gpg-keys 37-1 -> 37-2
                 fedora-repos 37-1 -> 37-2
                 fedora-repos-archive 37-1 -> 37-2
                 fedora-repos-modular 37-1 -> 37-2
                 fedora-repos-ostree 37-1 -> 37-2
                 firefox 109.0-4.fc37 -> 109.0.1-1.fc37
                 firefox-langpacks 109.0-4.fc37 -> 109.0.1-1.fc37
                 fwupd-efi 1.3-1.fc37 -> 1.4-1.fc37
                 gnome-shell 43.2-1.fc37 -> 43.2-2.fc37
                 hwdata 0.366-1.fc37 -> 0.367-1.fc37
                 javascriptcoregtk4.1 2.38.3-2.fc37 -> 2.38.4-1.fc37
                 javascriptcoregtk5.0 2.38.3-2.fc37 -> 2.38.4-1.fc37
                 kernel 6.1.8-200.fc37 -> 6.1.9-200.fc37
                 kernel-core 6.1.8-200.fc37 -> 6.1.9-200.fc37
                 kernel-modules 6.1.8-200.fc37 -> 6.1.9-200.fc37
                 kernel-modules-extra 6.1.8-200.fc37 -> 6.1.9-200.fc37
                 libavcodec-free 5.1.2-1.fc37 -> 5.1.2-6.fc37
                 libavformat-free 5.1.2-1.fc37 -> 5.1.2-6.fc37
                 libavutil-free 5.1.2-1.fc37 -> 5.1.2-6.fc37
                 libffi 3.4.2-9.fc37 -> 3.4.4-1.fc37
                 libgusb 0.4.3-1.fc37 -> 0.4.4-1.fc37
                 libhandy 1.8.0-1.fc37 -> 1.8.1-1.fc37
                 libphonenumber 8.12.57-3.fc37 -> 8.12.57-6.fc37
                 libpwquality 1.4.5-1.fc37 -> 1.4.5-3.fc37
                 libswresample-free 5.1.2-1.fc37 -> 5.1.2-6.fc37
                 libwacom 2.4.0-1.fc37 -> 2.6.0-1.fc37
                 libwacom-data 2.4.0-1.fc37 -> 2.6.0-1.fc37
                 mutter 43.2-1.fc37 -> 43.2-2.fc37
                 qgnomeplatform-qt5 0.9.0-6.fc37 -> 0.9.0-8.fc37
                 selinux-policy 37.18-1.fc37 -> 37.19-1.fc37
                 selinux-policy-targeted 37.18-1.fc37 -> 37.19-1.fc37
                 tpm2-tss 3.2.1-1.fc37 -> 3.2.2-1.fc37
                 vim-data 2:9.0.1221-1.fc37 -> 2:9.0.1262-1.fc37
                 vim-minimal 2:9.0.1221-1.fc37 -> 2:9.0.1262-1.fc37
                 virtualbox-guest-additions 7.0.4-1.fc37 -> 7.0.6-1.fc37
                 webkit2gtk4.1 2.38.3-2.fc37 -> 2.38.4-1.fc37
                 webkit2gtk5.0 2.38.3-2.fc37 -> 2.38.4-1.fc37
          Added: cracklib-dicts-2.9.7-30.fc37.x86_64
                 qemu-user-static-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-aarch64-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-alpha-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-arm-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-cris-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-hexagon-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-hppa-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-m68k-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-microblaze-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-mips-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-nios2-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-or1k-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-ppc-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-riscv-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-s390x-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-sh4-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-sparc-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-x86-2:7.0.0-13.fc37.x86_64
                 qemu-user-static-xtensa-2:7.0.0-13.fc37.x86_64

Diff with last rpm-ostree update:
--- /var/home/petersen/.cache/rpmostree-updates/previous-update	2023-02-09 14:51:37.536163366 +0800
+++ /var/home/petersen/.cache/rpmostree-updates/latest-update	2023-02-10 00:25:34.667648614 +0800
@@ -1 +1 @@
-1 metadata, 0 content objects fetched; 592 B transferred in 3 seconds; 0 bytes content written
+2 metadata, 0 content objects fetched; 53 KiB transferred in 8 seconds; 0 bytes content written
@@ -9,3 +9,3 @@
-rpm-md repo 'updates'; generated: 2023-02-08T00:54:33Z solvables: 18246
-rpm-md repo 'fedora'; generated: 2022-11-10T09:30:00Z solvables: 66822
-rpm-md repo 'updates-archive'; generated: 2023-02-08T01:28:03Z solvables: 23183
+rpm-md repo 'updates'; generated: 2023-02-09T08:58:55Z solvables: 18329
+rpm-md repo 'fedora'; generated: 2022-11-05T08:04:38Z solvables: 66822
+rpm-md repo 'updates-archive'; generated: 2023-02-09T09:27:37Z solvables: 23277
@@ -14,2 +14,2 @@
-        Version: 37.20230206.0 (2023-02-06T00:41:17Z)
-         Commit: fbc680ba4274752459c0d6e6a53ef61a3efbb24672073ff1e0c765896cd13792
+        Version: 37.20230209.0 (2023-02-09T00:46:24Z)
+         Commit: 319016f4e0ab3078cec37752128ff431bd77e3e71a122a5586df46b79097f050
@@ -17 +17 @@
-                 Signature made Mon 06 Feb 2023 08:46:01 AM using RSA key ID F55AD3FB5323552A
+                 Signature made Thu 09 Feb 2023 04:54:27 PM using RSA key ID F55AD3FB5323552A
@@ -22,0 +23,3 @@
+                 FEDORA-2023-25617e952a  Moderate   tpm2-tss-3.2.2-1.fc37.x86_64
+                   CVE-2023-22745 tpm2-tss: Buffer Overlow in TSS2_RC_Decode [fedora-all]
+                   https://bugzilla.redhat.com/show_bug.cgi?id=2162612
@@ -28,0 +32,4 @@
+                 FEDORA-2023-5210df1dd1  Moderate   javascriptcoregtk4.1-2.38.4-1.fc37.x86_64
+                 FEDORA-2023-5210df1dd1  Moderate   javascriptcoregtk5.0-2.38.4-1.fc37.x86_64
+                 FEDORA-2023-5210df1dd1  Moderate   webkit2gtk4.1-2.38.4-1.fc37.x86_64
+                 FEDORA-2023-5210df1dd1  Moderate   webkit2gtk5.0-2.38.4-1.fc37.x86_64
@@ -29,0 +37 @@
+                 buildah 1.28.0-6.fc37 -> 1.29.0-1.fc37
@@ -31,0 +40,2 @@
+                 cifs-utils 6.15-2.fc37 -> 7.0-1.fc37
+                 cifs-utils-info 6.15-2.fc37 -> 7.0-1.fc37
@@ -34,0 +45 @@
+                 dbus-broker 32-1.fc37 -> 33-1.fc37
@@ -37,0 +49,2 @@
+                 exiv2 0.27.5-3.fc37 -> 0.27.6-4.fc37
+                 exiv2-libs 0.27.5-3.fc37 -> 0.27.6-4.fc37
@@ -47,0 +61,2 @@
+                 javascriptcoregtk4.1 2.38.3-2.fc37 -> 2.38.4-1.fc37
+                 javascriptcoregtk5.0 2.38.3-2.fc37 -> 2.38.4-1.fc37
@@ -54,0 +70 @@
+                 libffi 3.4.2-9.fc37 -> 3.4.4-1.fc37
@@ -56,0 +73 @@
+                 libphonenumber 8.12.57-3.fc37 -> 8.12.57-6.fc37
@@ -64,0 +82 @@
+                 tpm2-tss 3.2.1-1.fc37 -> 3.2.2-1.fc37
@@ -67,0 +86,2 @@
+                 webkit2gtk4.1 2.38.3-2.fc37 -> 2.38.4-1.fc37
+                 webkit2gtk5.0 2.38.3-2.fc37 -> 2.38.4-1.fc37

Press Enter to update:
⠈ Writing objects: 1                                                                                                                117 metadata, 110 content objects fetched; 169971 KiB transferred in 9 seconds; 336.4 MB content written
Writing objects: 1... done
Checking out tree 319016f... done
Inactive requests:
  qemu-user-static (already provided by qemu-user-static-2:7.0.0-13.fc37.x86_64)
Enabled rpm-md repositories: fedora-cisco-openh264 updates fedora updates-archive
Updating metadata for 'fedora-cisco-openh264'... done
Updating metadata for 'updates'... done
Updating metadata for 'fedora'... done
Updating metadata for 'updates-archive'... done
Importing rpm-md... done
rpm-md repo 'fedora-cisco-openh264'; generated: 2022-10-06T11:01:40Z solvables: 4
rpm-md repo 'updates'; generated: 2023-02-09T08:58:55Z solvables: 18329
rpm-md repo 'fedora'; generated: 2022-11-05T08:04:38Z solvables: 66822
rpm-md repo 'updates-archive'; generated: 2023-02-09T09:27:37Z solvables: 23277
Resolving dependencies... done
Applying 10 overrides and 257 overlays
Processing packages... done
Running pre scripts... done
Running post scripts... done
Running posttrans scripts... done
Writing rpmdb... done
Writing OSTree commit... done
Staging deployment... done
Freed: 190.2 MB (pkgcache branches: 0)
Upgraded:
  SDL2 2.26.0-1.fc37 -> 2.26.2-1.fc37
  buildah 1.28.0-6.fc37 -> 1.29.0-1.fc37
  chromium 109.0.5414.74-1.fc37 -> 109.0.5414.119-1.fc37
  chromium-common 109.0.5414.74-1.fc37 -> 109.0.5414.119-1.fc37
  cifs-utils 6.15-2.fc37 -> 7.0-1.fc37
  cifs-utils-info 6.15-2.fc37 -> 7.0-1.fc37
  container-selinux 2:2.198.0-1.fc37 -> 2:2.199.0-1.fc37
  containers-common 4:1-76.fc37 -> 4:1-78.fc37
  containers-common-extra 4:1-76.fc37 -> 4:1-78.fc37
  dbus-broker 32-1.fc37 -> 33-1.fc37
  distribution-gpg-keys 1.81-1.fc37 -> 1.82-1.fc37
  evolution-data-server 3.46.3-1.fc37 -> 3.46.3-2.fc37
  evolution-data-server-langpacks 3.46.3-1.fc37 -> 3.46.3-2.fc37
  exiv2 0.27.5-3.fc37 -> 0.27.6-4.fc37
  exiv2-libs 0.27.5-3.fc37 -> 0.27.6-4.fc37
  fedora-gpg-keys 37-1 -> 37-2
  fedora-repos 37-1 -> 37-2
  fedora-repos-archive 37-1 -> 37-2
  fedora-repos-modular 37-1 -> 37-2
  fedora-repos-ostree 37-1 -> 37-2
  firefox 109.0-4.fc37 -> 109.0.1-1.fc37
  fwupd-efi 1.3-1.fc37 -> 1.4-1.fc37
  gnome-shell 43.2-1.fc37 -> 43.2-2.fc37
  hwdata 0.366-1.fc37 -> 0.367-1.fc37
  javascriptcoregtk4.1 2.38.3-2.fc37 -> 2.38.4-1.fc37
  javascriptcoregtk5.0 2.38.3-2.fc37 -> 2.38.4-1.fc37
  kernel 6.1.8-200.fc37 -> 6.1.9-200.fc37
  kernel-core 6.1.8-200.fc37 -> 6.1.9-200.fc37
  kernel-modules 6.1.8-200.fc37 -> 6.1.9-200.fc37
  kernel-modules-extra 6.1.8-200.fc37 -> 6.1.9-200.fc37
  libavcodec-free 5.1.2-1.fc37 -> 5.1.2-6.fc37
  libavformat-free 5.1.2-1.fc37 -> 5.1.2-6.fc37
  libavutil-free 5.1.2-1.fc37 -> 5.1.2-6.fc37
  libffi 3.4.2-9.fc37 -> 3.4.4-1.fc37
  libgusb 0.4.3-1.fc37 -> 0.4.4-1.fc37
  libhandy 1.8.0-1.fc37 -> 1.8.1-1.fc37
  libphonenumber 8.12.57-3.fc37 -> 8.12.57-6.fc37
  libpwquality 1.4.5-1.fc37 -> 1.4.5-3.fc37
  libswresample-free 5.1.2-1.fc37 -> 5.1.2-6.fc37
  libwacom 2.4.0-1.fc37 -> 2.6.0-1.fc37
  libwacom-data 2.4.0-1.fc37 -> 2.6.0-1.fc37
  mutter 43.2-1.fc37 -> 43.2-2.fc37
  qgnomeplatform-qt5 0.9.0-6.fc37 -> 0.9.0-8.fc37
  selinux-policy 37.18-1.fc37 -> 37.19-1.fc37
  selinux-policy-targeted 37.18-1.fc37 -> 37.19-1.fc37
  tpm2-tss 3.2.1-1.fc37 -> 3.2.2-1.fc37
  vim-data 2:9.0.1221-1.fc37 -> 2:9.0.1262-1.fc37
  vim-minimal 2:9.0.1221-1.fc37 -> 2:9.0.1262-1.fc37
  virtualbox-guest-additions 7.0.4-1.fc37 -> 7.0.6-1.fc37
  webkit2gtk4.1 2.38.3-2.fc37 -> 2.38.4-1.fc37
  webkit2gtk5.0 2.38.3-2.fc37 -> 2.38.4-1.fc37
Added:
  cracklib-dicts-2.9.7-30.fc37.x86_64
  opencore-amr-0.1.6-3.fc37.x86_64
  vo-amrwbenc-0.1.3-18.fc37.x86_64
  xvidcore-1.3.7-9.fc37.x86_64
  zvbi-0.2.35-17.fc37.x86_64
Run "systemctl reboot" to start a reboot
Press Enter for changelog:
ostree diff commit from: booted deployment (1f8a3fde1bc1ef54f95f84d629997e55453ab3303f8c42a40ba97ac337046d35)
ostree diff commit to:   pending deployment (161f7a880297f0b9fafa0a4871966d0b0ac00165b912aeb8fec588e14abdd226)
Upgraded:
  SDL2 2.26.0-1.fc37.x86_64 -> 2.26.2-1.fc37.x86_64
    * Sat Jan 21 2023 Tom Callaway <spot@fedoraproject.org> - 2.26.2-1
    - update to 2.26.2

    * Wed Jan 18 2023 Fedora Release Engineering <releng@fedoraproject.org> - 2.26.0-2
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

  buildah 1.28.0-6.fc37.x86_64 -> 1.29.0-1.fc37.x86_64
    * Tue Jan 31 2023 Lokesh Mandvekar <lsm5@fedoraproject.org> - 1.29.0-1
    - bump to v1.29.0

    * Wed Jan 18 2023 Fedora Release Engineering <releng@fedoraproject.org> - 1.28.2-2
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

    * Mon Nov 28 2022 RH Container Bot <rhcontainerbot@fedoraproject.org> - 1.28.2-1
    - auto bump to v1.28.2

    * Fri Oct 28 2022 Troy Dawson <tdawson@fedoraproject.org> - 1.28.0-7
    - Add ExclusiveArch

    * Tue Oct 25 2022 Lokesh Mandvekar <lsm5@fedoraproject.org> - 1.28.0-6
    - rebuild

  chromium 109.0.5414.74-1.fc37.x86_64 -> 109.0.5414.119-1.fc37.x86_64
  chromium-common 109.0.5414.74-1.fc37.x86_64 -> 109.0.5414.119-1.fc37.x86_64
    * Wed Jan 25 2023 Than Ngo <than@redhat.com> - 109.0.5414.119-1
    - update to 109.0.5414.119

    * Sun Jan 22 2023 Than Ngo <than@redhat.com> - 109.0.5414.74-4
    - clean up

    * Wed Jan 18 2023 Fedora Release Engineering <releng@fedoraproject.org> - 109.0.5414.74-3
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

    * Sun Jan 15 2023 Than Ngo <than@redhat.com> - 109.0.5414.74-2
    - conditionalize system_build_flags
    - cleaned up gn defines
    - add BR on python3-importlib-metadata
    - set correct toolchain gcc|clang
    - fix FTBFS with gcc13

  cifs-utils 6.15-2.fc37.x86_64 -> 7.0-1.fc37.x86_64
  cifs-utils-info 6.15-2.fc37.x86_64 -> 7.0-1.fc37.x86_64
    * Wed Feb 01 2023 Pavel Filipenský <pfilipen@redhat.com> - 7.0-1
    - Upstream release 7.0

  container-selinux 2:2.198.0-1.fc37.noarch -> 2:2.199.0-1.fc37.noarch
    * Tue Jan 31 2023 Lokesh Mandvekar <lsm5@fedoraproject.org> - 2:2.199.0-1
    - bump to v2.199.0

    * Fri Jan 06 2023 Lokesh Mandvekar <lsm5@fedoraproject.org> - 2:2.198.0-1
    - bump to v2.198.0

  containers-common 4:1-76.fc37.noarch -> 4:1-78.fc37.noarch
  containers-common-extra 4:1-76.fc37.noarch -> 4:1-78.fc37.noarch
    * Tue Jan 31 2023 Lokesh Mandvekar <lsm5@fedoraproject.org> - 4:1-78
    - adjust qemu-user-static dependencies in containers-common-extra

    * Thu Jan 26 2023 Daniel J Walsh <dwalsh@redhat.com> - 4:1-71
    - local build

  dbus-broker 32-1.fc37.x86_64 -> 33-1.fc37.x86_64
    * Mon Feb 06 2023 David Rheinsberg <david@readahead.eu> - 33-1
    - Update to upstream v33.

    * Thu Jan 19 2023 Fedora Release Engineering <releng@fedoraproject.org> - 32-2
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

  distribution-gpg-keys 1.81-1.fc37.noarch -> 1.82-1.fc37.noarch
    * Mon Jan 30 2023 Miroslav Suchý <msuchy@redhat.com> 1.82-1
    - move symlink of fedora-rawhide to fedora-39
    - add openEuler new key
    - update copr keys
    - add fedora 40 gpg key

  evolution-data-server 3.46.3-1.fc37.x86_64 -> 3.46.3-2.fc37.x86_64
  evolution-data-server-langpacks 3.46.3-1.fc37.noarch -> 3.46.3-2.fc37.noarch
    * Wed Jan 25 2023 Milan Crha <mcrha@redhat.com> - 3.46.3-2
    - Correct libical-glib version requirement

  exiv2 0.27.5-3.fc37.x86_64 -> 0.27.6-4.fc37.x86_64
  exiv2-libs 0.27.5-3.fc37.x86_64 -> 0.27.6-4.fc37.x86_64
    * Tue Jan 31 2023 Jan Grulich <jgrulich@redhat.com> - 0.27.6-1
    - 0.27.6
    - migrated to SPDX license

    * Thu Jan 19 2023 Fedora Release Engineering <releng@fedoraproject.org> - 0.27.5-4
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

  fedora-gpg-keys 37-1.noarch -> 37-2.noarch
  fedora-repos 37-1.noarch -> 37-2.noarch
  fedora-repos-archive 37-1.noarch -> 37-2.noarch
  fedora-repos-modular 37-1.noarch -> 37-2.noarch
  fedora-repos-ostree 37-1.noarch -> 37-2.noarch
    * Sun Jan 29 2023 Tomas Hrcka <thrcka@redhat.com> - 37-2
    - Adding F40 key

  firefox 109.0-4.fc37.x86_64 -> 109.0.1-1.fc37.x86_64
    * Wed Feb 01 2023 Martin Stransky <stransky@redhat.com>- 109.0.1-1
    - Updated to 109.0.1
    - Added fix for rhbz#2147344 / mzbz#1813500.

  fwupd-efi 1.3-1.fc37.x86_64 -> 1.4-1.fc37.x86_64
    * Fri Jan 27 2023 Richard Hughes <richard@hughsie.com> - 1.4-1
    - New upstream release

    * Thu Jul 21 2022 Fedora Release Engineering <releng@fedoraproject.org> - 1.3-2
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_37_Mass_Rebuild

    * Thu Apr 14 2022 Richard Hughes <richard@hughsie.com> - 1.3-1
    - New package version

  gnome-shell 43.2-1.fc37.x86_64 -> 43.2-2.fc37.x86_64
    * Wed Feb 01 2023 Jonas Ådahl <jadahl@redhat.com> - 43.2-2
    - Backport patches on the gnome-43 branch

  hwdata 0.366-1.fc37.noarch -> 0.367-1.fc37.noarch
    * Thu Feb 02 2023 Vitezslav Crhonek <vcrhonek@redhat.com> - 0.367-1
    - Update pci, usb and vendor ids

  javascriptcoregtk4.1 2.38.3-2.fc37.x86_64 -> 2.38.4-1.fc37.x86_64
  javascriptcoregtk5.0 2.38.3-2.fc37.x86_64 -> 2.38.4-1.fc37.x86_64
    * Thu Feb 02 2023 Michael Catanzaro <mcatanzaro@redhat.com> - 2.38.4-1
    - Update to 2.38.4

    * Fri Dec 23 2022 Michael Catanzaro <mcatanzaro@redhat.com> - 2.38.3-2
    - Revert "Fix javascriptcore5 Requires in webkitgtk6.0"

  kernel 6.1.8-200.fc37.x86_64 -> 6.1.9-200.fc37.x86_64
  kernel-core 6.1.8-200.fc37.x86_64 -> 6.1.9-200.fc37.x86_64
  kernel-modules 6.1.8-200.fc37.x86_64 -> 6.1.9-200.fc37.x86_64
  kernel-modules-extra 6.1.8-200.fc37.x86_64 -> 6.1.9-200.fc37.x86_64
    * Wed Feb 01 2023 Augusto Caringi <acaringi@redhat.com> [6.1.9-0]
    - Add BugsFixed file with bz entries to be included in updates. (Justin M. Forbes)
    - x86/mm: Randomize per-cpu entry area (Peter Zijlstra)
    - Update self-test data to not expect debugbuildsenabled 0 (Justin M. Forbes)
    - Turn off forced debug builds (Justin M. Forbes)
    - Turn on debug builds for aarch64 Fedora (Justin M. Forbes)
    - Linux v6.1.9

  libavcodec-free 5.1.2-1.fc37.x86_64 -> 5.1.2-6.fc37.x86_64
  libavformat-free 5.1.2-1.fc37.x86_64 -> 5.1.2-6.fc37.x86_64
  libavutil-free 5.1.2-1.fc37.x86_64 -> 5.1.2-6.fc37.x86_64
    * Mon Jan 30 2023 Neal Gompa <ngompa@fedoraproject.org> - 5.1.2-6
    - Enable more approved codecs

    * Thu Jan 19 2023 Fedora Release Engineering <releng@fedoraproject.org> - 5.1.2-5
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

    * Sun Jan 15 2023 Yaakov Selkowitz <yselkowi@redhat.com> - 5.1.2-4
    - Properly enable libzvbi_teletext decoder

    * Fri Dec 23 2022 Sandro Mani <manisandro@gmail.com> - 5.1.2-3
    - Rebuild (tesseract)

    * Wed Nov 09 2022 Neal Gompa <ngompa@fedoraproject.org> - 5.1.2-2
    - Unconditionally enable Vulkan

  libffi 3.4.2-9.fc37.x86_64 -> 3.4.4-1.fc37.x86_64
    * Fri Feb 03 2023 Carlos O'Donell <carlos@redhat.com> - 3.4.4-1
    - Rebase to libffi 3.4.4.

  libgusb 0.4.3-1.fc37.x86_64 -> 0.4.4-1.fc37.x86_64
    * Mon Jan 30 2023 Richard Hughes <richard@hughsie.com> - 0.4.4-1
    - New upstream release

    * Tue Dec 20 2022 Richard Hughes <richard@hughsie.com> - 0.4.3-1
    - New upstream version

  libhandy 1.8.0-1.fc37.x86_64 -> 1.8.1-1.fc37.x86_64
    * Wed Feb 01 2023 David King <amigadave@amigadave.com> - 1.8.1-1
    - Update to 1.8.1 (#2166285)

  libphonenumber 8.12.57-3.fc37.x86_64 -> 8.12.57-6.fc37.x86_64
    * Mon Jan 30 2023 Benjamin A. Beasley <code@musicinmybrain.net> - 8.12.57-6
    - Correctly build as C++17 instead of C++11 for gtest-1.13.0, which needs C++14

    * Thu Jan 19 2023 Fedora Release Engineering <releng@fedoraproject.org> - 8.12.57-5
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

    * Sat Dec 31 2022 Pete Walter <pwalter@fedoraproject.org> - 8.12.57-4
    - Rebuild for ICU 72

  libpwquality 1.4.5-1.fc37.x86_64 -> 1.4.5-3.fc37.x86_64
    * Wed Feb 01 2023 Adam Williamson <awilliam@redhat.com> - 1.4.5-3
    - Strengthen cracklib-dicts dependency to Recommends (#2158891)

    * Thu Jan 19 2023 Fedora Release Engineering <releng@fedoraproject.org> - 1.4.5-2
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

  libswresample-free 5.1.2-1.fc37.x86_64 -> 5.1.2-6.fc37.x86_64
    * Mon Jan 30 2023 Neal Gompa <ngompa@fedoraproject.org> - 5.1.2-6
    - Enable more approved codecs

    * Thu Jan 19 2023 Fedora Release Engineering <releng@fedoraproject.org> - 5.1.2-5
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

    * Sun Jan 15 2023 Yaakov Selkowitz <yselkowi@redhat.com> - 5.1.2-4
    - Properly enable libzvbi_teletext decoder

    * Fri Dec 23 2022 Sandro Mani <manisandro@gmail.com> - 5.1.2-3
    - Rebuild (tesseract)

    * Wed Nov 09 2022 Neal Gompa <ngompa@fedoraproject.org> - 5.1.2-2
    - Unconditionally enable Vulkan

  libwacom 2.4.0-1.fc37.x86_64 -> 2.6.0-1.fc37.x86_64
  libwacom-data 2.4.0-1.fc37.noarch -> 2.6.0-1.fc37.noarch
    * Mon Jan 23 2023 Peter Hutterer <peter.hutterer@redhat.com> - 2.6.0-1
    - libwacom 2.6.0

    * Thu Jan 19 2023 Fedora Release Engineering <releng@fedoraproject.org> - 2.4.0-2
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

  mutter 43.2-1.fc37.x86_64 -> 43.2-2.fc37.x86_64
    * Wed Feb 01 2023 Jonas Ådahl <jadahl@redhat.com> - 43.2-2
    - Backport patches on the gnome-43 branch

  qgnomeplatform-qt5 0.9.0-6.fc37.x86_64 -> 0.9.0-8.fc37.x86_64
    * Fri Jan 20 2023 Fedora Release Engineering <releng@fedoraproject.org> - 0.9.0-8
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

    * Tue Jan 17 2023 Jan Grulich <jgrulich@redhat.com> - 0.9.0-7
    - Rebuild (qt6)

  selinux-policy 37.18-1.fc37.noarch -> 37.19-1.fc37.noarch
  selinux-policy-targeted 37.18-1.fc37.noarch -> 37.19-1.fc37.noarch
    * Fri Feb 03 2023 Zdenek Pytela <zpytela@redhat.com> - 37.19-1
    - Allow systemd-userdbd the sys_resource capability
    - Additional support for rpmdb_migrate
    - Allow nm-cloud-setup dispatcher plugin restart nm services
    - Dontaudit ftpd the execmem permission
    - Allow icecast rename its log files
    - Allow systemd-rfkill the bpf capability

  tpm2-tss 3.2.1-1.fc37.x86_64 -> 3.2.2-1.fc37.x86_64
    * Wed Feb 01 2023 Peter Robinson <pbrobinson@fedoraproject.org> - 3.2.2-1
    - Update to 3.2.2

  vim-data 2:9.0.1221-1.fc37.noarch -> 2:9.0.1262-1.fc37.noarch
  vim-minimal 2:9.0.1221-1.fc37.x86_64 -> 2:9.0.1262-1.fc37.x86_64
    * Mon Jan 30 2023 Zdenek Dohnal <zdohnal@redhat.com> - 2:9.0.1262-1
    - patchlevel 1262

  virtualbox-guest-additions 7.0.4-1.fc37.x86_64 -> 7.0.6-1.fc37.x86_64
    * Mon Jan 30 2023 Sérgio Basto <sergio@serjux.com> - 7.0.6-1
    - Update virtualbox-guest-additions to 7.0.6 (#2161718)

    * Sat Jan 21 2023 Fedora Release Engineering <releng@fedoraproject.org> - 7.0.4-2
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild

  webkit2gtk4.1 2.38.3-2.fc37.x86_64 -> 2.38.4-1.fc37.x86_64
  webkit2gtk5.0 2.38.3-2.fc37.x86_64 -> 2.38.4-1.fc37.x86_64
    * Thu Feb 02 2023 Michael Catanzaro <mcatanzaro@redhat.com> - 2.38.4-1
    - Update to 2.38.4

    * Fri Dec 23 2022 Michael Catanzaro <mcatanzaro@redhat.com> - 2.38.3-2
    - Revert "Fix javascriptcore5 Requires in webkitgtk6.0"

Added:
  cracklib-dicts-2.9.7-30.fc37.x86_64
  opencore-amr-0.1.6-3.fc37.x86_64
  vo-amrwbenc-0.1.3-18.fc37.x86_64
  xvidcore-1.3.7-9.fc37.x86_64
  zvbi-0.2.35-17.fc37.x86_64

Diff with last rpm-ostree update:
--- /var/home/petersen/.cache/rpmostree-updates/previous-changelog	2023-02-08 12:32:23.757612662 +0800
+++ /var/home/petersen/.cache/rpmostree-updates/latest-changelog	2023-02-10 00:30:36.948768425 +0800
@@ -2 +2 @@
-ostree diff commit to:   pending deployment (85e1c6912d310c66b2a451787bc6ba8de261fac8fd78fce9dba3012aab39bb97)
+ostree diff commit to:   pending deployment (161f7a880297f0b9fafa0a4871966d0b0ac00165b912aeb8fec588e14abdd226)
@@ -10,0 +11,16 @@
+  buildah 1.28.0-6.fc37.x86_64 -> 1.29.0-1.fc37.x86_64
+    * Tue Jan 31 2023 Lokesh Mandvekar <lsm5@fedoraproject.org> - 1.29.0-1
+    - bump to v1.29.0
+
+    * Wed Jan 18 2023 Fedora Release Engineering <releng@fedoraproject.org> - 1.28.2-2
+    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild
+
+    * Mon Nov 28 2022 RH Container Bot <rhcontainerbot@fedoraproject.org> - 1.28.2-1
+    - auto bump to v1.28.2
+
+    * Fri Oct 28 2022 Troy Dawson <tdawson@fedoraproject.org> - 1.28.0-7
+    - Add ExclusiveArch
+
+    * Tue Oct 25 2022 Lokesh Mandvekar <lsm5@fedoraproject.org> - 1.28.0-6
+    - rebuild
+
@@ -28,0 +45,5 @@
+  cifs-utils 6.15-2.fc37.x86_64 -> 7.0-1.fc37.x86_64
+  cifs-utils-info 6.15-2.fc37.x86_64 -> 7.0-1.fc37.x86_64
+    * Wed Feb 01 2023 Pavel Filipenský <pfilipen@redhat.com> - 7.0-1
+    - Upstream release 7.0
+
@@ -43,0 +65,7 @@
+  dbus-broker 32-1.fc37.x86_64 -> 33-1.fc37.x86_64
+    * Mon Feb 06 2023 David Rheinsberg <david@readahead.eu> - 33-1
+    - Update to upstream v33.
+
+    * Thu Jan 19 2023 Fedora Release Engineering <releng@fedoraproject.org> - 32-2
+    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild
+
@@ -55,0 +84,9 @@
+  exiv2 0.27.5-3.fc37.x86_64 -> 0.27.6-4.fc37.x86_64
+  exiv2-libs 0.27.5-3.fc37.x86_64 -> 0.27.6-4.fc37.x86_64
+    * Tue Jan 31 2023 Jan Grulich <jgrulich@redhat.com> - 0.27.6-1
+    - 0.27.6
+    - migrated to SPDX license
+
+    * Thu Jan 19 2023 Fedora Release Engineering <releng@fedoraproject.org> - 0.27.5-4
+    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild
+
@@ -86,0 +124,8 @@
+  javascriptcoregtk4.1 2.38.3-2.fc37.x86_64 -> 2.38.4-1.fc37.x86_64
+  javascriptcoregtk5.0 2.38.3-2.fc37.x86_64 -> 2.38.4-1.fc37.x86_64
+    * Thu Feb 02 2023 Michael Catanzaro <mcatanzaro@redhat.com> - 2.38.4-1
+    - Update to 2.38.4
+
+    * Fri Dec 23 2022 Michael Catanzaro <mcatanzaro@redhat.com> - 2.38.3-2
+    - Revert "Fix javascriptcore5 Requires in webkitgtk6.0"
+
@@ -116,0 +162,4 @@
+  libffi 3.4.2-9.fc37.x86_64 -> 3.4.4-1.fc37.x86_64
+    * Fri Feb 03 2023 Carlos O'Donell <carlos@redhat.com> - 3.4.4-1
+    - Rebase to libffi 3.4.4.
+
@@ -127,0 +177,10 @@
+  libphonenumber 8.12.57-3.fc37.x86_64 -> 8.12.57-6.fc37.x86_64
+    * Mon Jan 30 2023 Benjamin A. Beasley <code@musicinmybrain.net> - 8.12.57-6
+    - Correctly build as C++17 instead of C++11 for gtest-1.13.0, which needs C++14
+
+    * Thu Jan 19 2023 Fedora Release Engineering <releng@fedoraproject.org> - 8.12.57-5
+    - Rebuilt for https://fedoraproject.org/wiki/Fedora_38_Mass_Rebuild
+
+    * Sat Dec 31 2022 Pete Walter <pwalter@fedoraproject.org> - 8.12.57-4
+    - Rebuild for ICU 72
+
@@ -179,0 +239,4 @@
+  tpm2-tss 3.2.1-1.fc37.x86_64 -> 3.2.2-1.fc37.x86_64
+    * Wed Feb 01 2023 Peter Robinson <pbrobinson@fedoraproject.org> - 3.2.2-1
+    - Update to 3.2.2
+
@@ -190,0 +254,8 @@
+
+  webkit2gtk4.1 2.38.3-2.fc37.x86_64 -> 2.38.4-1.fc37.x86_64
+  webkit2gtk5.0 2.38.3-2.fc37.x86_64 -> 2.38.4-1.fc37.x86_64
+    * Thu Feb 02 2023 Michael Catanzaro <mcatanzaro@redhat.com> - 2.38.4-1
+    - Update to 2.38.4
+
+    * Fri Dec 23 2022 Michael Catanzaro <mcatanzaro@redhat.com> - 2.38.3-2
+    - Revert "Fix javascriptcore5 Requires in webkitgtk6.0"

```

## Installation

`stack install` or `cabal install`

## Contributions

Feedback, suggestions, and patches welcome.

This might eventually get renamed to something like rpmostree-tool,
rpmostree-wrapper or even rpmost... if it should gain more command features.
