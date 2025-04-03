---
sitemap:
  lastmod: 2025-03-23 +0000
---

# SDDM

Last modified: 2025-03-23 +0000

## Interesting posts

- [How to not install xorg or x11 server while installing tumbleweed and just have wayland only? : r/openSUSE](https://www.reddit.com/r/openSUSE/comments/1bbbbm1/how_to_not_install_xorg_or_x11_server_while/)
- [openSUSE:DisplayManagerRework - openSUSE Wiki](https://en.opensuse.org/openSUSE:DisplayManagerRework)
- [Changes/WaylandByDefaultForSDDM - Fedora Project Wiki](https://fedoraproject.org/wiki/Changes/WaylandByDefaultForSDDM)
- [SDDM running on Wayland and Hyprland / Newbie Corner / Arch Linux Forums](https://bbs.archlinux.org/viewtopic.php?id=289612)

## Time format

Use `localectl set-locale LC_TIME=C.UTF-8` to set 24-Hour format.

## Greeter theme

- Go to [KDE Store](https://store.kde.org/browse?cat=101&ord=rating) to find a good one, e.g., [Sugar Candy for SDDM](https://store.kde.org/p/1312658).
- Preview the theme via `sddm-greeter --test-mode --theme /usr/share/sddm/themes/THEME_TO_VIEW`.

### Configure Sugar Candy for SDDM

On my machine, I changed `/usr/share/sddm/themes/sugar-candy/theme.conf.user` according to the following:

```properties
[General]
Background="/usr/share/wallpapers/default-1920x1080.jpg"
ScreenWidth="1920"
ScreenHeight="1080"
```
