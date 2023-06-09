# KDE Plasma Tweak

- [KDE Plasma Tweak](#kde-plasma-tweak)
  - [Widget](#widget)
  - [Recent files when right-clicking Firefox](#recent-files-when-right-clicking-firefox)
  - [Window focus stealing policy](#window-focus-stealing-policy)
  - [Change Task Switcher](#change-task-switcher)
  - [Virtual Desktop Behavior](#virtual-desktop-behavior)
  - [Hide Window Border](#hide-window-border)
  - [Mouse wheel scroll speed](#mouse-wheel-scroll-speed)
  - [Baloo](#baloo)
  - [KWallet](#kwallet)
    - [Blowfish and GPG](#blowfish-and-gpg)
    - [KWallet and VSCode](#kwallet-and-vscode)
  - [SDDM login theme](#sddm-login-theme)
    - [Configure Sugar Candy for SDDM](#configure-sugar-candy-for-sddm)

## Widget

- [Event Calendar]( https://store.kde.org/p/998901 )
- [Prime Render Switch and Status]( https://store.kde.org/p/1425330 )

## Recent files when right-clicking Firefox

Open *System Settings > Workspace Behavior > Recent Files*.

*References*:

- https://www.reddit.com/r/kde/comments/ef17uq/dont_show_recent_documents_when_rightclicking_app/

## Window focus stealing policy

- Open *System Settings > Window Behavior > Focus > Focus stealing prevention*
- Choose *None*

## Change Task Switcher

- Open *System Settings > Window Management > Task Switcher*
- Select *Thumbnails Grid*.

## Virtual Desktop Behavior

Open *System Settings > Window Management > Window Behavior > Advanced*.

**Note**: ~~At the time of writing (*Tumbleweed 20230211, KDE Plasma 5.26.5, Firefox 109.0.1*), there is a bug that Firefox does not follow the behavior.~~

**Update**: At the time of updating (*Tumbleweed 20230224, KDE Plasma 5.27.1, Firefox 109.0.1*), the bug is already fixed.

*References*:

- [Firefox 108.0 jumps to different desktop](https://askubuntu.com/questions/1445505/firefox-108-0-jumps-to-different-desktop)
- [Prevent a browser window from changing virtual desktops when an application on another desktop opens a link?](https://www.reddit.com/r/kde/comments/zm6gag/prevent_a_browser_window_from_changing_virtual/)
- [Windows do not stay on the virtual desktop they are on](https://bugs.kde.org/show_bug.cgi?id=462996)

## Hide Window Border

*References*:

- https://medium.com/@CodyReichert/how-to-hide-title-bars-in-kde-plasma-5-348e0df4087f

## Mouse wheel scroll speed

- [ ] todo

*References*:

- [Mouse wheel speed](https://forum.kde.org/viewtopic.php?t=160416)

## Baloo

At the time of writing (*Tumbleweed 20230225, Baloo 5.103.0*), `baloo_file` constantly writes to my disk. Thus, I disabled it by `balooctl disable`.

## KWallet

*References*:

- [the official doc]( https://docs.kde.org/trunk5/en/kwalletmanager/kwallet5/index.html ) ([PDF version]( https://docs.kde.org/stable5/en/kwalletmanager/kwallet5/kwallet5.pdf ))
- [Arch wiki]( https://wiki.archlinux.org/title/KDE_Wallet )

### Blowfish and GPG

Some references:

- [Why don't we use Blowfish if it hasn't been cracked?](https://crypto.stackexchange.com/questions/87278/why-dont-we-use-blowfish-if-it-hasnt-been-cracked)
- [Kwallet and KMail: What’s GPG? What’s Blowfish? Why a Blank Password?](https://forums.opensuse.org/t/kwallet-and-kmail-whats-gpg-whats-blowfish-why-a-blank-password/113770)

### KWallet and VSCode

The simplest method: create a wallet in KWallet and use a blank password.

**NOTE**: At the time of writing (*Tumbleweed 20230225*, *KDE Plasma 5.27.1*), if no other application uses KWallet (e.g. not encrypting any WiFi password with KWallet), then KWallet might not automatically open the wallet at user login, which will cause VSCode authentication failure. But you can still config the KWallet to auto-unlock referring to [the post]( https://gist.github.com/Trucido/b788017a18e1189e6703e42315e8829c ).

*References*:

- [Settings Sync#Troubleshooting keychain issues](https://code.visualstudio.com/docs/editor/settings-sync#_linux)
- [KDE WALLET](https://github.com/microsoft/vscode/issues/104319)

## SDDM login theme

- Go to [KDE Store](https://store.kde.org/browse?cat=101&ord=rating) to find a good one, e.g [Sugar Candy for SDDM](https://store.kde.org/p/1312658).
- Preview the theme via `sddm-greeter --test-mode --theme /usr/share/sddm/themes/THEME_TO_BE_VIEWED`.

### Configure Sugar Candy for SDDM

Change `/usr/share/sddm/themes/sugar-candy/theme.conf.user` according to the following:

```properties
[General]
Background="/usr/share/wallpapers/default-1920x1080.jpg"
ScreenWidth="1920"
ScreenHeight="1080"
```
