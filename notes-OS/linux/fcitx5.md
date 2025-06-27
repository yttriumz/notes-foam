---
sitemap:
  lastmod: 2025-04-29 +0000
---

# Fcitx 5

Last modified: 2025-04-29 +0000

## Interesting posts

- ['Fcitx 5' and 'Fcitx 5 Wayland Launcher', which should I choose? / Applications & Desktop Environments / Arch Linux Forums](https://bbs.archlinux.org/viewtopic.php?id=292049)
  - [Fcitx 5.1.7](https://groups.google.com/g/fcitx-announce/c/K7W1ATH2Viw)

## Flatpak

The following is based on Aurora 41 (based on Fedora Kinoite, on Wayland).

1. Make sure the host has an IM framework installed.
2. Install Fcitx 5 in Flatpak via:

   ```bash
   flatpak install flathub org.fcitx.Fcitx5
   ```

3. ~~Configure autostart via~~ No need:

   ```bash
   cp -L /var/lib/flatpak/exports/share/applications/org.fcitx.Fcitx5.desktop .config/autostart/
   ```

4. Go to *System Settings > Keyboard > Virtual Keyboard*, and select *Fcitx5*.
5. Maybe set environment variables according to the [official wiki](https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland). But I didn't and it works fine.
6. Reboot to make it work.

*References*:

- [Flatpak-only setup? · fcitx/fcitx5 · Discussion #288](https://github.com/fcitx/fcitx5/discussions/288)
- [透過Flatpak跑Fcitx5，安裝Linux的中文輸入法 · Ivon的部落格](https://ivonblog.com/posts/fcitx5-flatpak/)
