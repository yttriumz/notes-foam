# KDE Plasma Tweak

## Widget

- [Event Calendar]( https://store.kde.org/p/998901 )
- [Prime Render Switch and Status]( https://store.kde.org/p/1425330 )

## Recent files when right-clicking Firefox

Open *System Settings > Workspace Behavior > Recent Files*.

- https://www.reddit.com/r/kde/comments/ef17uq/dont_show_recent_documents_when_rightclicking_app/

## Window focus stealing policy

- Open *System Settings > Window Behavior > Focus > Focus stealing prevention*
- Choose *None*

## Change Task Switcher

- Open *System Settings > Window Management > Task Switcher*
- Select *Thumbnails Grid*.

## Virtual Desktop Behavior

Open *System Settings > Window Management > Window Behavior > Advanced*.

**Note**:

- ~~At the time of writing (*Tumbleweed 20230211, KDE Plasma 5.26.5, Firefox 109.0.1*), there is a bug that Firefox does not follow the behavior.~~

  **Update**: At the time of updating (*Tumbleweed 20230224, KDE Plasma 5.27.1, Firefox 109.0.1*), the bug is already fixed.

  References:

  - [Firefox 108.0 jumps to different desktop](https://askubuntu.com/questions/1445505/firefox-108-0-jumps-to-different-desktop)
  - [Prevent a browser window from changing virtual desktops when an application on another desktop opens a link?](https://www.reddit.com/r/kde/comments/zm6gag/prevent_a_browser_window_from_changing_virtual/)
  - [Windows do not stay on the virtual desktop they are on](https://bugs.kde.org/show_bug.cgi?id=462996)

## Hide Window Border

Refer to [the post]( https://medium.com/@CodyReichert/how-to-hide-title-bars-in-kde-plasma-5-348e0df4087f ).

## Baloo

At the time of writing (*Tumbleweed 20230225, Baloo 5.103.0*), `baloo_file` constantly writes to my disk. Thus, I disabled it by `balooctl disable`.
