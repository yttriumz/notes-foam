# X.Org

## Disable middle click using `xmodmap`

### Check the current pointer map

Use `xmodmap -pp`.

### Disable the middle key

1. putting the following contents to `~/.Xmodmap`:

    ```text
    pointer = 1 0 3 4 5 6 7 8 9 10
    ```

2. Then apply the settings by `xmodmap ~/.Xmodmap`.

Note that this will completely disable the middle click function, which might cause problems in applications where the middle click is used, e.g., *Cyberpunk 2077*.

References:

- [Middle mouse click paste - how to disable?](https://www.reddit.com/r/openSUSE/comments/qtto1d/middle_mouse_click_paste_how_to_disable/)
- [How to disable mouse scroll wheel click to paste in openSUSE / Plasma5?](https://forums.opensuse.org/t/how-to-disable-mouse-scroll-wheel-click-to-paste-in-opensuse-plasma5/117824)
- https://wiki.archlinux.org/title/Xmodmap#Swapping_mouse_buttons
