---
sitemap:
  lastmod: 2025-03-28 +0000
  priority: 1.0
---

# KDE Plasma Tweak

Last modified: 2025-03-28 +0000

- [Interesting posts](#interesting-posts)
- [Configuration backup](#configuration-backup)
- [Wallpaper](#wallpaper)
- [Widget](#widget)
- [Autostart](#autostart)
- [Recent files when right-clicking Firefox](#recent-files-when-right-clicking-firefox)
- [Window focus stealing policy](#window-focus-stealing-policy)
- [Change task switcher](#change-task-switcher)
- [Virtual Desktop behavior](#virtual-desktop-behavior)
- [Window title bar](#window-title-bar)
- [Hide window border](#hide-window-border)
- [Move a window to the center](#move-a-window-to-the-center)
- [Show window geometry information](#show-window-geometry-information)
- [Mouse wheel scroll speed](#mouse-wheel-scroll-speed)
- [Disable middle click pasting](#disable-middle-click-pasting)
- [Baloo](#baloo)
- [KWallet](#kwallet)
  - [Blowfish and GPG](#blowfish-and-gpg)
  - [KWallet \& VSCode](#kwallet--vscode)
- [Tiling](#tiling)
- [SDDM](#sddm)

## Interesting posts

- [desktop environments - What is KDE, GTK, GTK+, QT, and/or GNOME? - Ask Ubuntu](https://askubuntu.com/questions/249150/what-is-kde-gtk-gtk-qt-and-or-gnome)
- [\| Beginner here: What is the difference between a window manager and a Desktop environment? : r/unixporn](https://www.reddit.com/r/unixporn/comments/t7jnhh/beginner_here_what_is_the_difference_between_a/)
- [KDE Plasma與GNOME桌面比較，最終我還是選擇KDE · Ivon的部落格](https://ivonblog.com/posts/kde-plasma-gnome-comparison/)
- [plasmashell crash on wayland : r/openSUSE](https://www.reddit.com/r/openSUSE/comments/10v0lxl/plasmashell_crash_on_wayland/)
- [Prayag2/konsave: A command line program written in Python to let you backup your dotfiles and switch to other ones in an instant. Works out-of-the box on KDE Plasma!](https://github.com/Prayag2/konsave/tree/master)
- [compiz - KDE decrease opacity of active window - Ask Ubuntu](https://askubuntu.com/questions/1069565/kde-decrease-opacity-of-active-window)
- [How to disable ALL animations : r/kde](https://www.reddit.com/r/kde/comments/1by7gpg/how_to_disable_all_animations/)

Concerning issues:

- [No fingerprint unlock option after waking from sleep - Help - KDE Discuss](https://discuss.kde.org/t/no-fingerprint-unlock-option-after-waking-from-sleep/29903)

## Configuration backup

*References*:

- [Config File To Backup Taskbar Settings? - Support / KDE Plasma - Manjaro Linux Forum](https://forum.manjaro.org/t/config-file-to-backup-taskbar-settings/147366)

## Wallpaper

Check `$HOME/.config/plasmarc` to find the user wallpapers.

*References*:

- [Where is my current wallpaper stored? : r/kde](https://www.reddit.com/r/kde/comments/j5miau/where_is_my_current_wallpaper_stored/)

## Widget

Plasma 5:

- [Event Calendar](https://store.kde.org/p/998901)
- [Prime Render Switch and Status](https://store.kde.org/p/1425330)
- [luisbocanegra/plasma-panel-colorizer: Latte-Dock and WM status bar customization features for the default KDE Plasma panel](https://github.com/luisbocanegra/plasma-panel-colorizer)

## Autostart

*References*:

- [System Settings/Startup and Shutdown - KDE UserBase Wiki](https://userbase.kde.org/System_Settings/Startup_and_Shutdown#Autostart)
- [System Settings/Autostart - KDE UserBase Wiki](https://userbase.kde.org/System_Settings/Autostart)
- [Autostart](https://docs.kde.org/stable5/en/plasma-workspace/kcontrol/autostart/index.html)

## Recent files when right-clicking Firefox

1. Go to *System Settings > Workspace Behavior > Recent Files*.
2. Select *Do not remember*.

*References*:

- [Don't Show Recent Documents When Right-Clicking App Icon in Task Manager. : r/kde](https://www.reddit.com/r/kde/comments/ef17uq/dont_show_recent_documents_when_rightclicking_app/)

## Window focus stealing policy

1. Go to *System Settings > Window Behavior > Focus > Focus stealing prevention*.
2. Select *None*.

## Change task switcher

1. Go to *System Settings > Window Management > Task Switcher*.
2. Select *Thumbnails Grid*. At the time of updating (*Plasma 6.0.3*), this is the default.

## Virtual Desktop behavior

1. Go to *System Settings > Window Management > Window Behavior > Advanced*.
2. Select *Switch to that Virtual Desktop* for *Virtual Desktop behavior*. At the time of updating (*Plasma 6.0.3*), this is the default.

**NOTE**: ~~At the time of writing (*Tumbleweed 20230211, KDE Plasma 5.26.5, Firefox 109.0.1*), there is a bug that Firefox does not follow the behavior.~~ At the time of updating (*Tumbleweed 20230224, Plasma 5.27.1, Firefox 109.0.1*), the bug is already fixed.

*References*:

- [Firefox 108.0 jumps to different desktop](https://askubuntu.com/questions/1445505/firefox-108-0-jumps-to-different-desktop)
- [Prevent a browser window from changing virtual desktops when an application on another desktop opens a link?](https://www.reddit.com/r/kde/comments/zm6gag/prevent_a_browser_window_from_changing_virtual/)
- [Windows do not stay on the virtual desktop they are on](https://bugs.kde.org/show_bug.cgi?id=462996)

## Window title bar

*References*:

- [Title Bar Color - Brainstorm - KDE Discuss](https://discuss.kde.org/t/title-bar-color/10401)
- [Titlebar Color change? - Help - KDE Discuss](https://discuss.kde.org/t/titlebar-color-change/17231)

## Hide window border

1. Create a window rule for the desired window/application, or go to *System Settings > Window Management > Window Rules > Add New...*.
2. Click *Add Property...* and search for *No titlebar and frame*. Select *Force* and *Yes*.

*References*:

- [How to hide title bars in KDE plasma 5](https://medium.com/@CodyReichert/how-to-hide-title-bars-in-kde-plasma-5-348e0df4087f)

## Move a window to the center

1. Go to *System Settings > Shortcuts > KWin > Move Window to the Center*.
2. I changed the custom shortcuts to `Meta` + `Ctrl` + `C`.

## Show window geometry information

Plasma 5: Install *Window Geometry Information* from KDE store.

Plasma 6:

1. Download the scripts from [*Richard Qian / KWin Scripts by Worldblender · GitLab*](https://gitlab.com/Worldblender/kwin-scripts).
2. Place the scripts folder for Plasma 6 under `/usr/share/kwin/scripts`.

*References*:

- [Window Geometry Information - KDE Store](https://store.kde.org/p/1833846)
  - [Richard Qian / KWin Scripts by Worldblender · GitLab](https://gitlab.com/Worldblender/kwin-scripts)

## Mouse wheel scroll speed

X11: Did not find a solution.

Wayland: Go to *System Settings > Mouse & Touchpad > Mouse\|Touchpad > Scrolling speed*.

*References*:

- [Is there a way to increase scroll speed? : r/kde](https://www.reddit.com/r/kde/comments/u0w5kg/is_there_a_way_to_increase_scroll_speed/)
- [Can the mouse scroll speed be configured in KDE, nowadays? I'm flabbergasted tha... \| Hacker News](https://news.ycombinator.com/item?id=33955640)

## Disable middle click pasting

X11: It is not supported, but there are some workarounds. See [[Xorg#Disable the middle click pasting]].

Wayland: Go to *System Settings > General Behavior > Middle Click*. However, not all applications follow this setting, some of which may have something to do with Xwayland.

Application specific:

- Firefox: See [[Firefox#Disable middle click pasting]].
- VSCode: See [[vscode/tips#Disable middle click pasting]]
- WezTerm: See [[terminal-tools#WezTerm]].

## Baloo

At the time of writing (*Tumbleweed 20230225, Baloo 5.103.0*), `baloo_file` constantly writes to my disk. So I disabled it via `balooctl disable`.

*References*:

- [Will KDE 6 finally ditch baloo for something better? : r/kde](https://www.reddit.com/r/kde/comments/1atta90/will_kde_6_finally_ditch_baloo_for_something/)

## KWallet

*References*:

- [the official doc](https://docs.kde.org/trunk5/en/kwalletmanager/kwallet5/index.html)
  - [PDF version](https://docs.kde.org/stable5/en/kwalletmanager/kwallet5/kwallet5.pdf)
- [KDE Wallet - ArchWiki](https://wiki.archlinux.org/title/KDE_Wallet)

### Blowfish and GPG

Some references:

- [Why don't we use Blowfish if it hasn't been cracked?](https://crypto.stackexchange.com/questions/87278/why-dont-we-use-blowfish-if-it-hasnt-been-cracked)
- [Kwallet and KMail: What’s GPG? What’s Blowfish? Why a Blank Password?](https://forums.opensuse.org/t/kwallet-and-kmail-whats-gpg-whats-blowfish-why-a-blank-password/113770)

### KWallet & VSCode

The simplest method is to create a wallet in KWallet and use a blank password.

At the time of writing (*Tumbleweed 20230225*, *KDE Plasma 5.27.1*), if no other application uses KWallet (e.g., not encrypting any WiFi password with KWallet), then KWallet might not automatically open the wallet at user login, which will cause VSCode authentication failure. However, according to [this post](https://gist.github.com/Trucido/b788017a18e1189e6703e42315e8829c), you can still configure the KWallet to auto-unlock, which I didn't test.

*References*:

- [Troubleshooting keychain issues](https://code.visualstudio.com/docs/editor/settings-sync#_troubleshooting-keychain-issues)
- [KDE WALLET · Issue #104319 · microsoft/vscode](https://github.com/microsoft/vscode/issues/104319)

## Tiling

*References*:

- [Tiling in Plasma 6 : r/kde](https://www.reddit.com/r/kde/comments/1b99iok/tiling_in_plasma_6/)

## SDDM

See [[sddm]].

[//begin]: # "Autogenerated link references for markdown compatibility"
[Xorg#Disable the middle click pasting]: Xorg.md "X.Org"
[Firefox#Disable middle click pasting]: ../Firefox.md "Firefox"
[vscode/tips#Disable middle click pasting]: ../../notes-development/vscode/tips.md "General Visual Studio Code Usage Tips"
[terminal-tools#WezTerm]: terminal-tools.md "Terminal Related Tools"
[sddm]: sddm.md "SDDM"
[//end]: # "Autogenerated link references"
