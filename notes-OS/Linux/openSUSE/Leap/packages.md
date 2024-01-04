# Leap Package Management

Last modified: 2024/01/04 UTC

- [Zypper](#zypper)
  - [Add repositories](#add-repositories)
    - [Packman and NVidia](#packman-and-nvidia)
    - [VSCode](#vscode)
    - [containers](#containers)
    - [NVIDIA Container Toolkit](#nvidia-container-toolkit)
    - [CUDA](#cuda)
    - [M17N (Multilingualization)](#m17n-multilingualization)
    - [Google Chrome](#google-chrome)
    - [Microsoft Edge](#microsoft-edge)
    - [Brave Browser](#brave-browser)
    - [Cloudflare WARP](#cloudflare-warp)
    - [Emulators](#emulators)
  - [Examine repositories](#examine-repositories)
  - [Set priority](#set-priority)
  - [Package query](#package-query)
    - [Unused Packages](#unused-packages)
    - [Installation History](#installation-history)
    - [Package Dependency](#package-dependency)
  - [Lock](#lock)
    - [Lock packages](#lock-packages)
    - [Lock patterns](#lock-patterns)
    - [List locks](#list-locks)
  - [Check dependencies](#check-dependencies)
- [Install rpm](#install-rpm)
  - [WezTerm](#wezterm)
  - [Zoom](#zoom)
  - [WARP (manually)](#warp-manually)
  - [QQ](#qq)
  - [WeChat](#wechat)
  - [Xtreme Download Manager](#xtreme-download-manager)
  - [Motrix download manager](#motrix-download-manager)
  - [ToDesk](#todesk)
- [OBS Package Installer (OPI)](#obs-package-installer-opi)
  - [Install OPI](#install-opi)
- [Flatpak](#flatpak)
  - [Interesting posts](#interesting-posts)
  - [Install Flatpak](#install-flatpak)
  - [Add repositories](#add-repositories-1)
  - [Uninstall unused packages](#uninstall-unused-packages)
- [Become a Packager](#become-a-packager)

Most of the procedures should be the same as the ones in [[Tumbleweed/packages]]. But some repository addresses might be different, which will be listed here.

## Zypper

### Add repositories

#### Packman and NVidia

See [[Tumbleweed/packages#Packman (essentials) and NVidia]].

#### VSCode

See [[Tumbleweed/packages#VSCode]].

#### containers

Add *Virtualization:containers* repository via the following commands:

```bash
zypper addrepo https://download.opensuse.org/repositories/Virtualization:/containers/15.5/Virtualization:containers.repo
```

*References*:

- [docker from Virtualization:containers project](https://software.opensuse.org/download.html?project=Virtualization%3Acontainers&package=docker#manualopenSUSE)

#### NVIDIA Container Toolkit

See [[Tumbleweed/packages#NVIDIA Container Toolkit]].

#### CUDA

See [[Tumbleweed/packages#CUDA]].

#### M17N (Multilingualization)

Add *M17N* repository via the following commands:

```bash
zypper addrepo https://download.opensuse.org/repositories/M17N/openSUSE_Tumbleweed/M17N.repo
```

#### Google Chrome

See [[Tumbleweed/packages#Google Chrome]].

#### Microsoft Edge

See [[Tumbleweed/packages#Microsoft Edge]].

#### Brave Browser

See [[Tumbleweed/packages#Brave Browser]].

#### Cloudflare WARP

See [[Tumbleweed/packages#Cloudflare WARP]].

See [[WARP]] for configuration.

#### Emulators

Add *Emulators* repository via the following commands:

```bash
zypper addrepo https://download.opensuse.org/repositories/Emulators/openSUSE_Tumbleweed/Emulators.repo
```

### Examine repositories

- Use *YaST*.
- Or use `zypper repos -P`.

### Set priority

- Use *YaST*.
- Or use `zypper modifyrepo -p`.

### Package query

#### Unused Packages

1. Use `zypper packages --unneeded` to examine.

2. Use `zypper packages --unneeded | grep ^i | cut -d '|' -f3 | xargs sudo zypper rm --clean-deps --no-confirm` to uninstall.

*References*:

- [Cleanup of distribution upgrades](https://forums.opensuse.org/t/cleanup-of-distribution-upgrades/152148)

#### Installation History

The history can be found in `/var/log/zypp/history`. Root permission might be needed.

#### Package Dependency

- Use `zypper info --requires SOME_PACKAGE` to check `SOME_PACKAGE`'s dependency.
- Use `zypper search --requires SOME_PACKAGE` to obtain packages that needs `SOME_PACKAGE`.

### Lock

#### Lock packages

- Use *YaST*.
- Or use `zypper addlock SOME_PACKAGE`.

#### Lock patterns

Use `zypper addlock --type pattern SOME_PATTERN`.

#### List locks

Use `zypper locks`.

### Check dependencies

Verify the dependencies of installed packages via `zypper verify`.

## Install rpm

Use `zypper install PATH_TO_RPM`.

*References*:

- [10. Installing Software](https://opensuse-guide.org/installpackage.php)
- [how to install RPM files](https://forums.opensuse.org/t/how-to-install-rpm-files/24479)

### WezTerm

At the time of writing (*WezTerm 20230326.111934.3666303c-1.1* from official site), **if you install WezTerm using `zypper install wezterm` from openSUSE's repository**, there is a bug that WezTerm leaves a file `dhat-heap.json` in the directory where it's opened on. Directly installing the official package could solve the problem. Go to [the official site](https://wezfurlong.org/wezterm/install/linux.html#installing-on-fedora-and-rpm-based-systems) to find the latest stable version.

### Zoom

- Download from [the official site](https://zoom.us/download?os=linux).
  - `ibus` could be locked before installing.
- Or use `opi zoom`.

*References*:

- [Installing or updating Zoom on Linux](https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux)
- [Does anyone here know of a good guide for installing zoom?](https://www.reddit.com/r/openSUSE/comments/p4yhg0/does_anyone_here_know_of_a_good_guide_for/)

### WARP (manually)

1. ~~At the time of writing (*Tumbleweed 20230518, WARP 2023.3.398*), install `setcap` via `zypper install libcap-progs`. Otherwise, the post-install script will fail to run.~~ At the time of updating (*Tumbleweed 20230718, WARP 2023.7.40*), no need to install `libcap-progs`.
   - At the time of updating (*Tumbleweed 20230718, WARP 2023.7.40*), during installation, zypper will report "nothing provides 'dbus' needed". I just ignored it.
2. ~~Download from [the official site](https://pkg.cloudflareclient.com/packages/cloudflare-warp)~~. At the time of updating (*2023-06-21*), direct access to the package is forbidden.

See [[WARP]] for configuration.

*References*:

- [How to install Linux capabilities like setcap and getcap?](https://unix.stackexchange.com/questions/189237/how-to-install-linux-capabilities-like-setcap-and-getcap)

### QQ

Download from [the official site](https://im.qq.com/linuxqq/index.shtml).

- At the time of updating (*Tumbleweed 20231006, linuxqq 3.2.1_17153-1*), during installation, zypper will report "nothing provides 'libuuid' needed". I just ignored it.

### WeChat

- [ ] todo

*References*:

- [fedora 打包 wechat RPM 包](https://xuthus.cc/linux/fedora-packaged-wechat-rpm.html)

### Xtreme Download Manager

Download from [the official site](https://github.com/subhra74/xdm/releases).

### Motrix download manager

Download from [the official site](https://github.com/agalwood/Motrix/releases).

**NOTE**: At the time of writing (*Tumbleweed 20230518*), it does not work. I did not further investigate.

### ToDesk

Download from [the official site](https://www.todesk.com/linux.html).

## OBS Package Installer (OPI)

### Install OPI

Use `zypper install opi`.

## Flatpak

### Interesting posts

- [Flatpak Is Not the Future](https://ludocode.com/blog/flatpak-is-not-the-future)
- [Hacker News discussion](https://news.ycombinator.com/item?id=29316024)

### Install Flatpak

Use `zypper install flatpak`.

### Add repositories

Add *flathub* repository via the following commands:

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

*References*:

- [The community guide]( https://opensuse.github.io/openSUSE-docs-revamped-temp/best_of_post/#setup-your-tumbleweed-for-flatpaks )

### Uninstall unused packages

Use `flatpak uninstall --unused`.

## Become a Packager

*References*:

- [Guide: How To Become A Packager](https://www.reddit.com/r/openSUSE/comments/10rpb24/guide_how_to_become_a_packager/)

[//begin]: # "Autogenerated link references for markdown compatibility"
[Tumbleweed/packages]: ..%2FTumbleweed%2Fpackages.md "Tumbleweed Package Management"
[Tumbleweed/packages#Packman (essentials) and NVidia]: ..%2FTumbleweed%2Fpackages.md "Tumbleweed Package Management"
[Tumbleweed/packages#VSCode]: ..%2FTumbleweed%2Fpackages.md "Tumbleweed Package Management"
[Tumbleweed/packages#NVIDIA Container Toolkit]: ..%2FTumbleweed%2Fpackages.md "Tumbleweed Package Management"
[Tumbleweed/packages#CUDA]: ..%2FTumbleweed%2Fpackages.md "Tumbleweed Package Management"
[Tumbleweed/packages#Google Chrome]: ..%2FTumbleweed%2Fpackages.md "Tumbleweed Package Management"
[Tumbleweed/packages#Microsoft Edge]: ..%2FTumbleweed%2Fpackages.md "Tumbleweed Package Management"
[Tumbleweed/packages#Brave Browser]: ..%2FTumbleweed%2Fpackages.md "Tumbleweed Package Management"
[Tumbleweed/packages#Cloudflare WARP]: ..%2FTumbleweed%2Fpackages.md "Tumbleweed Package Management"
[WARP]: ..%2F..%2F..%2Fcross-platform%2Fremote%2FWARP.md "Cloudflare WARP Usage"
[//end]: # "Autogenerated link references"
