# KDE Plasma Tweak

- [Interesting posts](#interesting-posts)
- [Widget](#widget)
- [Autostart](#autostart)
- [Recent files when right-clicking Firefox](#recent-files-when-right-clicking-firefox)
- [Window focus stealing policy](#window-focus-stealing-policy)
- [Change task switcher](#change-task-switcher)
- [Virtual Desktop behavior](#virtual-desktop-behavior)
- [Hide window border](#hide-window-border)
- [Move a window to the center](#move-a-window-to-the-center)
- [Mouse wheel scroll speed](#mouse-wheel-scroll-speed)
- [Baloo](#baloo)
- [KWallet](#kwallet)
  - [Blowfish and GPG](#blowfish-and-gpg)
  - [KWallet \& VSCode](#kwallet--vscode)
- [SDDM login theme](#sddm-login-theme)
  - [Configure Sugar Candy for SDDM](#configure-sugar-candy-for-sddm)
- [Dolphin](#dolphin)

## Interesting posts

- [KDE Plasma與GNOME桌面比較，最終我還是選擇KDE](https://ivonblog.com/posts/kde-plasma-gnome-comparison/)
- [plasmashell crash on wayland](https://www.reddit.com/r/openSUSE/comments/10v0lxl/plasmashell_crash_on_wayland/)
- [Prayag2/konsave: A command line program written in Python to let you backup your dotfiles and switch to other ones in an instant. Works out-of-the box on KDE Plasma!](https://github.com/Prayag2/konsave/tree/master)

## Widget

- [Event Calendar](https://store.kde.org/p/998901)
- [Prime Render Switch and Status](https://store.kde.org/p/1425330)

## Autostart

*References*:

- [Autostart](https://userbase.kde.org/System_Settings/Startup_and_Shutdown#Autostart)
- [System Settings/Autostart](https://userbase.kde.org/System_Settings/Autostart)
- [Autostart](https://docs.kde.org/stable5/en/plasma-workspace/kcontrol/autostart/index.html)

## Recent files when right-clicking Firefox

- Go to *System Settings > Workspace Behavior > Recent Files*.
- Select *Do not remember*.

*References*:

- https://www.reddit.com/r/kde/comments/ef17uq/dont_show_recent_documents_when_rightclicking_app/

## Window focus stealing policy

- Go to *System Settings > Window Behavior > Focus > Focus stealing prevention*
- Choose *None*

## Change task switcher

- Go to *System Settings > Window Management > Task Switcher*
- Select *Thumbnails Grid*.

## Virtual Desktop behavior

- Go to *System Settings > Window Management > Window Behavior > Advanced > Virtual Desktop behavior*.
- Select *Switch to that Virtual Desktop*.

**Note**: ~~At the time of writing (*Tumbleweed 20230211, KDE Plasma 5.26.5, Firefox 109.0.1*), there is a bug that Firefox does not follow the behavior.~~ At the time of updating (*Tumbleweed 20230224, KDE Plasma 5.27.1, Firefox 109.0.1*), the bug is already fixed.

*References*:

- [Firefox 108.0 jumps to different desktop](https://askubuntu.com/questions/1445505/firefox-108-0-jumps-to-different-desktop)
- [Prevent a browser window from changing virtual desktops when an application on another desktop opens a link?](https://www.reddit.com/r/kde/comments/zm6gag/prevent_a_browser_window_from_changing_virtual/)
- [Windows do not stay on the virtual desktop they are on](https://bugs.kde.org/show_bug.cgi?id=462996)

## Hide window border

- Create a window rule for the desired window/application, or go to *System Settings > Window Management > Window Rules > Add New...*.
- Click *Add Property...* and search for *No titlebar and frame*. Select *Force* and *Yes*.

*References*:

- [How to hide title bars in KDE plasma 5](https://medium.com/@CodyReichert/how-to-hide-title-bars-in-kde-plasma-5-348e0df4087f)

## Move a window to the center

- Go to *System Settings > Shortcuts > KWin > Move Window to the Center*.
- I changed the custom shortcuts to `Meta` + `Ctrl` + `C`.

## Mouse wheel scroll speed

- [ ] todo

*References*:

- [Mouse wheel speed](https://forum.kde.org/viewtopic.php?t=160416)

## Baloo

At the time of writing (*Tumbleweed 20230225, Baloo 5.103.0*), `baloo_file` constantly writes to my disk. Thus, I disabled it by `balooctl disable`.

## KWallet

*References*:

- [the official doc]( https://docs.kde.org/trunk5/en/kwalletmanager/kwallet5/index.html ) ([PDF version]( https://docs.kde.org/stable5/en/kwalletmanager/kwallet5/kwallet5.pdf ))
- [KDE Wallet - ArchWiki]( https://wiki.archlinux.org/title/KDE_Wallet )

### Blowfish and GPG

Some references:

- [Why don't we use Blowfish if it hasn't been cracked?](https://crypto.stackexchange.com/questions/87278/why-dont-we-use-blowfish-if-it-hasnt-been-cracked)
- [Kwallet and KMail: What’s GPG? What’s Blowfish? Why a Blank Password?](https://forums.opensuse.org/t/kwallet-and-kmail-whats-gpg-whats-blowfish-why-a-blank-password/113770)

### KWallet & VSCode

The simplest method: create a wallet in KWallet and use a blank password.

**NOTE**: At the time of writing (*Tumbleweed 20230225*, *KDE Plasma 5.27.1*), if no other application uses KWallet (e.g. not encrypting any WiFi password with KWallet), then KWallet might not automatically open the wallet at user login, which will cause VSCode authentication failure. But you can still config the KWallet to auto-unlock referring to [this post](https://gist.github.com/Trucido/b788017a18e1189e6703e42315e8829c).

*References*:

- [Settings Sync#Troubleshooting keychain issues](https://code.visualstudio.com/docs/editor/settings-sync#_linux)
- [KDE WALLET](https://github.com/microsoft/vscode/issues/104319)

## SDDM login theme

- Go to [KDE Store](https://store.kde.org/browse?cat=101&ord=rating) to find a good one, e.g [Sugar Candy for SDDM](https://store.kde.org/p/1312658).
- Preview the theme via `sddm-greeter --test-mode --theme /usr/share/sddm/themes/THEME_TO_BE_VIEWED`.

### Configure Sugar Candy for SDDM

On my machine, I changed `/usr/share/sddm/themes/sugar-candy/theme.conf.user` according to the following:

```properties
[General]
Background="/usr/share/wallpapers/default-1920x1080.jpg"
ScreenWidth="1920"
ScreenHeight="1080"
```

## Dolphin

*References*:

- [A comprehensive guide to Dolphin, a KDE file manager](https://opensource.com/life/15/8/comprehensive-guide-dolphin-file-manager)
