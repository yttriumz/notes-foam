---
sitemap:
  lastmod: 2024-05-26 +0000
  priority: 1.0
---

# openSUSE Package Management

Last modified: 2024-05-26 +0000

**NOTE**: This note assumes Tumbleweed by default, but most content should also apply to Leap. Some of the existing differences between Tumbleweed and Leap are mentioned in the corresponding instructions.

- [Interesting posts](#interesting-posts)
- [Zypper](#zypper)
  - [Commonly used repositories](#commonly-used-repositories)
    - [Packman (essentials) and NVidia](#packman-essentials-and-nvidia)
    - [VSCode](#vscode)
    - [Container](#container)
    - [NVIDIA Container Toolkit](#nvidia-container-toolkit)
    - [CUDA](#cuda)
    - [M17N (Multilingualization)](#m17n-multilingualization)
    - [Google Chrome](#google-chrome)
    - [Microsoft Edge](#microsoft-edge)
    - [Brave Browser](#brave-browser)
    - [Cloudflare WARP](#cloudflare-warp)
    - [Emulators](#emulators)
    - [Kubernetes](#kubernetes)
  - [Examine repositories](#examine-repositories)
    - [Reference for some repositories](#reference-for-some-repositories)
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
- [RPM Package](#rpm-package)
  - [Install an RPM](#install-an-rpm)
  - [Inspect an RPM](#inspect-an-rpm)
  - [Commonly used packages](#commonly-used-packages)
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
  - [Installation](#installation)
  - [Use Flatpak](#use-flatpak)
- [AppImage](#appimage)
- [Become a Packager](#become-a-packager)

## Interesting posts

- [Why is packman broken so often : openSUSE](https://www.reddit.com/r/openSUSE/comments/10ku115/why_is_packman_broken_so_often/)

## Zypper

### Commonly used repositories

#### Packman (essentials) and NVidia

Open *YaST Software Repositories*, select *Add > Community Repositories*, and choose the desired repos to add.

**NOTE**: *YaST Software* may automatically select some NVidia drivers to install. Do **not** accept the changes because they will probably cause problems. See [[tweak-P1-Gen2#NVIDIA graphics card]].

*References*:

- [Package repositories - openSUSE Wiki](https://en.opensuse.org/Package_repositories)
- [Additional package repositories - openSUSE Wiki](https://en.opensuse.org/Additional_package_repositories)

#### VSCode

- Add *VSCode* repository (and install VSCode) via the following commands:

  ```bash
  rpm --import https://packages.microsoft.com/keys/microsoft.asc
  zypper addrepo https://packages.microsoft.com/yumrepos/vscode VSCode
  zypper refresh
  zypper install code
  ```

- Or use `opi vscode`.

*References*:

- [Wiki](https://en.opensuse.org/Visual_Studio_Code#Install)

#### Container

Add *Virtualization:containers* repository via the following commands:

```bash
# Tumbleweed
zypper addrepo https://download.opensuse.org/repositories/Virtualization:/containers/openSUSE_Tumbleweed/Virtualization:containers.repo

# Leap
zypper addrepo https://download.opensuse.org/repositories/Virtualization:/containers/15.5/Virtualization:containers.repo
```

*References*:

- [docker from Virtualization:containers project](https://software.opensuse.org/download.html?project=Virtualization%3Acontainers&package=docker#manualopenSUSE)

#### NVIDIA Container Toolkit

1. Install NVIDIA drivers. See [[tweak-P1-Gen2#Install driver and prime-select]].
2. Add *NVIDIA Container Toolkit* repository via the following commands:

   ```bash
   zypper addrepo https://nvidia.github.io/libnvidia-container/opensuse-leap15.5/libnvidia-container.repo

   # The following one is the same
   zypper addrepo https://nvidia.github.io/libnvidia-container/sles15.5/libnvidia-container.repo
   ```

   You may want to add the [GPG key](https://nvidia.github.io/libnvidia-container/gpgkey).

3. Install *NVIDIA Container Toolkit* via the following commands:

   ```bash
   zypper install nvidia-container-toolkit
   ```

4. Config *docker* via the following commands:

   ```bash
   nvidia-ctk runtime configure --runtime=docker
   ```

5. Verify installation via the following commands:

   ```bash
   docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
   ```

*References*:

- [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker)
- [Installation Guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
- [package info details](https://github.com/NVIDIA/nvidia-docker/issues/1268#issuecomment-632692949)
- [How to use with Docker 19.03 / nvidia-container-toolkit?](https://github.com/NVIDIA/k8s-device-plugin/issues/168#issuecomment-625981223)

#### CUDA

Add *CUDA* repository via the following commands:

```bash
zypper addrepo -p 100 https://developer.download.nvidia.com/compute/cuda/repos/opensuse15/x86_64/cuda-opensuse15.repo
```

*References*:

- [CUDA on Tumbleweed](https://www.reddit.com/r/openSUSE/comments/gaihe9/cuda_on_tumbleweed/)

#### M17N (Multilingualization)

Add *M17N* repository via the following commands:

```bash
zypper addrepo https://download.opensuse.org/repositories/M17N/openSUSE_Tumbleweed/M17N.repo
```

#### Google Chrome

- Add *Google Chrome* repository and (and install *Google Chrome*) via the following commands:

  ```bash
  rpm --import https://dl.google.com/linux/linux_signing_key.pub
  zypper addrepo https://dl.google.com/linux/chrome/rpm/stable/x86_64 "Google Chrome"
  zypper refresh
  zypper install google-chrome-stable
  ```

- Or use `opi chrome`.

*References*:

- [Google Linux Software Repositories](https://www.google.com/linuxrepositories/)
- [Installing Google Chrome in openSUSE](https://linuxhint.com/installing-google-chrome-opensuse/)

#### Microsoft Edge

- Add *Microsoft Edge* repository (and install *Microsoft Edge*) via the following commands:

  ```bash
  rpm --import https://packages.microsoft.com/keys/microsoft.asc
  zypper addrepo https://packages.microsoft.com/yumrepos/edge "Microsoft Edge"
  zypper refresh
  zypper install microsoft-edge-stable
  ```

- Or use `opi msedge`.

Microsoft Edge Config files are stored under the following paths.

- `$HOME/.cache/microsoft-edge`
- `$HOME/.cache/Microsoft/Edge`
- `$HOME/.config/microsoft-edge`

#### Brave Browser

- Add *Brave* repository (and install *Brave*) via the following commands:

  ```bash
  rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
  zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
  zypper refresh
  zypper install brave-browser
  ```

- Or use `opi brave`.

*References*:

- [Installing Brave on Linux](https://brave.com/linux/)

#### Cloudflare WARP

1. Dependencies:

   - Install `setcap` via `zypper install libcap-progs`. Otherwise, the installation will be faulty with the following message:

     ```text
     setcap is not installed
     warning: %post(cloudflare-warp-2024.4.133-1.x86_64) scriptlet failed, exit status 1
     ```

   - At the time of updating (*Tumbleweed 20230718, WARP 2023.7.40*), it's safe to ignore the message "nothing provides 'dbus' needed by the to be installed cloudflare-warp".

2. Add *WARP* repository (and install *WARP*) via the following commands:

   ```bash
   zypper addrepo https://pkg.cloudflareclient.com/cloudflare-warp-ascii.repo
   zypper refresh
   zypper install cloudflare-warp
   ```

   You may want to add the [GPG key](https://pkg.cloudflareclient.com/pubkey.gpg).

~~Check also [manual installation](#warp-manually).~~

See [[WARP]] for configuration.

*References*:

- [Red Hat Enterprise Linux & CentOS](https://pkg.cloudflareclient.com/#rhel)

#### Emulators

Add *Emulators* repository via the following commands:

```bash
zypper addrepo https://download.opensuse.org/repositories/Emulators/openSUSE_Tumbleweed/Emulators.repo
```

#### Kubernetes

- Many tools are already provided in the openSUSE official Oss repository.
- But still, the official *Kubernetes* repository can be added via the following commands, if preferred:

  ```bash
  zypper addrepo https://pkgs.k8s.io/core:/stable:/v1.29/rpm/ "Kubernetes v1.29"
  zypper refresh
  zypper install kubectl
  ```

*References*:

- [pkgs.k8s.io: Introducing Kubernetes Community-Owned Package Repositories \| Kubernetes](https://kubernetes.io/blog/2023/08/15/pkgs-k8s-io-introduction/)

### Examine repositories

- Use *YaST*.
- Or use `zypper repos -P`.

#### Reference for some repositories

![repos](attachments/packages/repo_ref.png)

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

## RPM Package

### Install an RPM

Use `zypper install PATH_TO_RPM`.

*References*:

- [10. Installing Software](https://opensuse-guide.org/installpackage.php)
- [how to install RPM files](https://forums.opensuse.org/t/how-to-install-rpm-files/24479)

### Inspect an RPM

- List the files in an RPM file: `rpm -qlpv PATH_TO_RPM`

*References*:

- [Inspecting and extracting RPM package contents with & without installing the package \| Packagecloud Blog](https://blog.packagecloud.io/inspect-extract-contents-rpm-packages/)

### Commonly used packages

#### WezTerm

~~At the time of writing (*WezTerm 20230326.111934.3666303c-1.1* from official site), **if you install WezTerm using `zypper install wezterm` from openSUSE's repository**, there is a bug that WezTerm leaves a file `dhat-heap.json` in the directory where it's opened on. Directly installing the official package could solve the problem. Go to [the official site](https://wezfurlong.org/wezterm/install/linux.html#installing-on-fedora-and-rpm-based-systems) to find the latest stable version.~~ At the time of updating (*WezTerm 20240203.110809.5046fc22-1.1* from openSUSE's repository), the issue is gone.

#### Zoom

- Download from [the official site](https://zoom.us/download?os=linux).
  - `ibus` could be locked before installing.
- Or use `opi zoom`.

*References*:

- [Installing or updating Zoom on Linux](https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux)
- [Does anyone here know of a good guide for installing zoom?](https://www.reddit.com/r/openSUSE/comments/p4yhg0/does_anyone_here_know_of_a_good_guide_for/)

#### WARP (manually)

~~Download from [the official site](https://pkg.cloudflareclient.com/packages/cloudflare-warp)~~. At the time of updating (*2023-06-21*), direct access to the package is forbidden.

See [[WARP]] for configuration.

*References*:

- [How to install Linux capabilities like setcap and getcap?](https://unix.stackexchange.com/questions/189237/how-to-install-linux-capabilities-like-setcap-and-getcap)

#### QQ

Download from [the official site](https://im.qq.com/linuxqq/index.shtml).

- At the time of updating (*Tumbleweed 20231006, linuxqq 3.2.1_17153-1*), during installation, zypper will report "nothing provides 'libuuid' needed". I just ignored it.

#### WeChat

*References*:

- [WeChat - ArchWiki](https://wiki.archlinux.org/title/WeChat)
- [web1n/wechat-universal-flatpak: Flatpak 打包微信 Linux Universal 版](https://github.com/web1n/wechat-universal-flatpak)
- [【国产系统】史诗级更新Linux 微信wechat-beta_1.0.0.150（快来还热乎） - 『精品软件区』 - 吾爱破解 - LCG - LSG \|安卓破解\|病毒分析\|www.52pojie.cn](https://www.52pojie.cn/thread-1896902-1-1.html)
- [huan/docker-wechat: DoChat is a Dockerized WeChat (盒装微信) PC Windows Client for Linux](https://github.com/huan/docker-wechat)
- [fedora 打包 wechat RPM 包](https://xuthus.cc/linux/fedora-packaged-wechat-rpm.html)
- [微信网页版 2.0 测试版发布](http://weixin.qq.com/cgi-bin/readtemplate?uin=&stype=&promote=&fr=&lang=zh_CN&ADTAG=&check=false&nav=faq&t=weixin_faq&faq=webwx_2)

#### Xtreme Download Manager

Download from [the official site](https://github.com/subhra74/xdm/releases).

#### Motrix download manager

Download from [the official site](https://github.com/agalwood/Motrix/releases).

**NOTE**: At the time of writing (*Tumbleweed 20230518*), it does not work. I did not further investigate.

#### ToDesk

Download from [the official site](https://www.todesk.com/linux.html).

## OBS Package Installer (OPI)

### Install OPI

Use `zypper install opi`.

```text
The following recommended package was automatically selected:
  python-rpm-generators  20240202.501440e-1.2  noarch  openSUSE-Tumbleweed-Oss  openSUSE

The following 34 NEW packages are going to be installed:
  cmake                       3.29.3-1.1             x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  cmake-full                  3.29.3-1.1             x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  cmake-man                   3.29.3-1.1             x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  debugedit                   5.0-5.9                x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  dwz                         0.15-3.2               x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  jq                          1.7.1-1.3              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  libjq1                      1.7.1-1.3              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  libjsoncpp25                1.9.5-2.7              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  libjsoncpp25-x86-64-v3      1.9.5-2.7              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  libonig5                    6.9.9-1.3              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  libqt5-qtdeclarative-tools  5.15.13+kde30-1.2      x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  libQt6JsonRpc6              6.7.0-1.1              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  libQt6LanguageServer6       6.7.0-1.1              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  libQt6QmlCompiler6          6.7.0-1.1              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  librhash1                   1.4.4-1.4              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  librpmbuild10               4.19.1.1-3.2           x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  ninja                       1.12.0-1.1             x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  opi                         5.0.0-2.1              noarch  openSUSE-Tumbleweed-Oss  openSUSE
  python311-cssselect         1.2.0-2.8              noarch  openSUSE-Tumbleweed-Oss  openSUSE
  python311-lxml              5.1.0-3.2              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  python311-packaging         24.0-1.1               noarch  openSUSE-Tumbleweed-Oss  openSUSE
  python311-rpm               4.19.1.1-3.2           x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  python311-setuptools        69.0.3-1.4             noarch  openSUSE-Tumbleweed-Oss  openSUSE
  python311-termcolor         2.4.0-1.5              noarch  openSUSE-Tumbleweed-Oss  openSUSE
  python-rpm-generators       20240202.501440e-1.2   noarch  openSUSE-Tumbleweed-Oss  openSUSE
  python-rpm-macros           20240202.501440e-1.2   noarch  openSUSE-Tumbleweed-Oss  openSUSE
  python-rpm-packaging        20210526+a18ca48-1.11  noarch  openSUSE-Tumbleweed-Oss  openSUSE
  qml-autoreqprov             1.4.1-1.3              noarch  openSUSE-Tumbleweed-Oss  openSUSE
  qt6-base-common-devel       6.7.0-2.1              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  qt6-declarative-tools       6.7.0-1.1              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  qt6-macros                  20240131-1.2           x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  rpm-build                   4.19.1.1-3.2           x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  rpm-build-perl              4.19.1.1-3.2           x86_64  openSUSE-Tumbleweed-Oss  openSUSE
  squashfs                    4.6.1-2.4              x86_64  openSUSE-Tumbleweed-Oss  openSUSE
```

## Flatpak

### Installation

Use `zypper install flatpak`.

### Use Flatpak

See [[Flatpak]].

## AppImage

*References*:

- [Frequently Asked Questions — AppImage documentation](https://docs.appimage.org/user-guide/faq.html#question-where-do-i-store-my-appimages)

## Become a Packager

*References*:

- [Guide: How To Become A Packager](https://www.reddit.com/r/openSUSE/comments/10rpb24/guide_how_to_become_a_packager/)

[//begin]: # "Autogenerated link references for markdown compatibility"
[tweak-P1-Gen2#NVIDIA graphics card]: tweak-P1-Gen2.md "Tweak openSUSE Tumbleweed on ThinkPad P1 Gen2"
[tweak-P1-Gen2#Install driver and prime-select]: tweak-P1-Gen2.md "Tweak openSUSE Tumbleweed on ThinkPad P1 Gen2"
[WARP]: ../../remote/WARP.md "Cloudflare WARP"
[Flatpak]: ../Flatpak.md "Flatpak"
[//end]: # "Autogenerated link references"
