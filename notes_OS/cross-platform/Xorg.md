# X.Org

## Disable middle click using `xmodmap`

### Check the current pointer map

Use `xmodmap -pp`.

### Restore `xmodmap` settings

*References*:

There is no way to restore it directly.

- [How do I clear xmodmap settings?](https://askubuntu.com/questions/29603/how-do-i-clear-xmodmap-settings)

### Disable the middle key

1. putting the following contents to `~/.Xmodmap`:

    ```text
    pointer = 1 0 3 4 5 6 7 8 9 10
    ```

2. Then apply the settings by `xmodmap ~/.Xmodmap`.

Note that this will completely disable the middle click function, which might cause problems in applications where the middle click is used, e.g., *Cyberpunk 2077*.

*References*:

- [Middle mouse click paste - how to disable?](https://www.reddit.com/r/openSUSE/comments/qtto1d/middle_mouse_click_paste_how_to_disable/)
- [How to disable mouse scroll wheel click to paste in openSUSE / Plasma5?](https://forums.opensuse.org/t/how-to-disable-mouse-scroll-wheel-click-to-paste-in-opensuse-plasma5/117824)
- [How to disable middle mouse button pasting and set for navigating?](https://forum.manjaro.org/t/how-to-disable-middle-mouse-button-pasting-and-set-for-navigating/82144/4)
- [Disable Middle-click paste (and JUST paste)](https://www.reddit.com/r/kde/comments/7a71fa/disable_middleclick_paste_and_just_paste/)
- https://wiki.archlinux.org/title/Xmodmap#Swapping_mouse_buttons
