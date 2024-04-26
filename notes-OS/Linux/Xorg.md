---
sitemap:
  lastmod: 2024-04-24 +0000
---

# X.Org

Last Modified: 2024-04-24 +0000

**Note**: This post assumes X11 by default.

- [`xmodmap`](#xmodmap)
   - [Check the current pointer map](#check-the-current-pointer-map)
   - [Restore `xmodmap` defaults](#restore-xmodmap-defaults)
   - [Disable the middle click pasting](#disable-the-middle-click-pasting)
      - [Completely disable the middle click](#completely-disable-the-middle-click)
      - [Workarounds](#workarounds)

## `xmodmap`

### Check the current pointer map

Use `xmodmap -pp`.

### Restore `xmodmap` defaults

There is no way to restore it directly.

*References*:

- [How do I clear xmodmap settings?](https://askubuntu.com/questions/29603/how-do-i-clear-xmodmap-settings)

### Disable the middle click pasting

At the time of updating (*X Server 1.21.1.12, Plasma 6.0.4*), there's no native solution.

#### Completely disable the middle click

1. Put the following contents in `~/.Xmodmap` and apply the settings via `xmodmap ~/.Xmodmap`:

   ```text
   pointer = 1 0 3
   ```

   It is also automatically applied every time the user logs in.

   Note that this might cause problems in applications where the middle click is necessary, e.g., *Cyberpunk 2077*.

2. You can restore it by writing the following to `~/.Xmodmap-restore-middle-click` and apply via `xmodmap ~/Xmodmap-restore-middle-click`:

   ```text
   pointer = 1 2 3
   ```

*References*:

- [Middle mouse click paste - how to disable?](https://www.reddit.com/r/openSUSE/comments/qtto1d/middle_mouse_click_paste_how_to_disable/)
- [How to disable mouse scroll wheel click to paste in openSUSE / Plasma5?](https://forums.opensuse.org/t/how-to-disable-mouse-scroll-wheel-click-to-paste-in-opensuse-plasma5/117824)
- [How to disable middle mouse button pasting and set for navigating?](https://forum.manjaro.org/t/how-to-disable-middle-mouse-button-pasting-and-set-for-navigating/82144/4)
- [Disable Middle-click paste (and JUST paste)](https://www.reddit.com/r/kde/comments/7a71fa/disable_middleclick_paste_and_just_paste/)
- [8 Swapping mouse buttons](https://wiki.archlinux.org/title/Xmodmap#Swapping_mouse_buttons)

#### Workarounds

- [milaq/XMousePasteBlock: Userspace tool to disable middle mouse button paste in Xorg](https://github.com/milaq/XMousePasteBlock) (not tested)
