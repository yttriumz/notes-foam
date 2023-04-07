# X.Org

## Disable middle click using `xmodmap`

- Check the current pointer map by `xmodmap -pp`.
- Disable the middle key by putting the following contents to `~/.Xmodmap`:

  ```text
  pointer = 1 0 3 4 5 6 7 8 9 10
  ```

  Then apply the settings by `xmodmap ~/.Xmodmap`.

References:

- https://www.reddit.com/r/openSUSE/comments/qtto1d/middle_mouse_click_paste_how_to_disable/
- https://forums.opensuse.org/t/how-to-disable-mouse-scroll-wheel-click-to-paste-in-opensuse-plasma5/117824
- https://wiki.archlinux.org/title/Xmodmap#Swapping_mouse_buttons
