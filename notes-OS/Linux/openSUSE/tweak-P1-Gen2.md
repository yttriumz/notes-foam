---
sitemap:
  lastmod: 2024-11-01 +0000
  priority: 1.0
---

# Tweak openSUSE Tumbleweed on ThinkPad P1 Gen2

Last modified: 2024-11-01 +0000

- [Interesting posts](#interesting-posts)
- [Change hostname](#change-hostname)
- [Network settings](#network-settings)
  - [WiFi](#wifi)
- [Swappiness](#swappiness)
- [Hibernation](#hibernation)
- [Kexec \& Kdump](#kexec--kdump)
- [System upgrade](#system-upgrade)
  - [Upgrade failures](#upgrade-failures)
- [Package management](#package-management)
- [Shell \& terminal](#shell--terminal)
  - [Bash alias](#bash-alias)
  - [Starship](#starship)
  - [WezTerm](#wezterm)
  - [Zellij](#zellij)
- [NVIDIA graphics card](#nvidia-graphics-card)
  - [Install driver and prime-select](#install-driver-and-prime-select)
  - [NVIDIA module not loaded](#nvidia-module-not-loaded)
  - [Make applications run on NVIDIA card](#make-applications-run-on-nvidia-card)
  - [If graphics driver or graphical desktop does not work](#if-graphics-driver-or-graphical-desktop-does-not-work)
  - [Benchmark](#benchmark)
- [Codecs](#codecs)
- [Touchpad gestures](#touchpad-gestures)
- [Fingerprint](#fingerprint)
- [IR camera](#ir-camera)
- [Bluetooth](#bluetooth)
- [Fonts](#fonts)
- [Locale](#locale)
- [Input method](#input-method)
  - [Rime](#rime)
- [Power management](#power-management)
- [Fan control](#fan-control)
- [Grub2 theme](#grub2-theme)
- [KDE tweak](#kde-tweak)
- [Mouse](#mouse)
  - [Disable middle click](#disable-middle-click)
  - [Scroll speed](#scroll-speed)
- [Boot parameters](#boot-parameters)
- [zram](#zram)
- [Development environment](#development-environment)
- [Gaming](#gaming)
- [Printers](#printers)
  - [HP](#hp)
- [Hotspot](#hotspot)
  - [Use `linux-wifi-hotspot`](#use-linux-wifi-hotspot)

## Interesting posts

- https://opensuse.github.io/openSUSE-docs-revamped-temp/best_of_post/
- https://opensuse.github.io/openSUSE-docs-revamped-temp/safety_usability/
- [21 Things To Do After Installing OpenSUSE](https://averagelinuxuser.com/after-installing-opensuse/)
- [Very new to SUSE - should I install anything to optimise functionality on a laptop? : openSUSE](https://www.reddit.com/r/openSUSE/comments/194u8d3/very_new_to_suse_should_i_install_anything_to/)

## Change hostname

Change the hostname via the following commands:

```bash
hostnamectl hostname NEW_HOSTNAME
```

## Network settings

If in TTY mode, `nmtui` can be run for a user-friendly UI.

### WiFi

- eduroam: refer to [the HKUST ITSC guide](https://itsc.hkust.edu.hk/services/general-it-services/wifi/wi-fi-services/configuration-eduroam).

## Swappiness

- Check current swappiness by `cat /proc/sys/vm/swappiness`.
- Change the swappiness permanently by adding the following content to `/etc/sysctl.d/sysctl.conf` (reboot may be required for the setting to take effect):

  ```text
  vm.swappiness = YOU_DESIRED_VALUE
  ```

## Hibernation

Hibernation is disabled by default for security reasons. You can check dracut modules via `lsinitrd /boot/IMAGE_YOU_WANT_TO_CHECK | less`.

*References*:

- [Hibernation, Sleep, Configuration - English / Hardware - openSUSE Forums](https://forums.opensuse.org/t/hibernation-sleep-configuration/146316/2)
- [System Fails to Resume from Hibernation \| Support \| SUSE](https://www.suse.com/support/kb/doc/?id=000020287)

## Kexec & Kdump

*References*:

- [Kexec and Kdump \| System Analysis and Tuning Guide \| openSUSE Leap 15.6](https://doc.opensuse.org/documentation/leap/tuning/html/book-tuning/cha-tuning-kexec.html)
- LUN:
  - [The mystery behind LUN(Logical Unit Number) \| Unixbhaskar's Blog](https://unixbhaskar.wordpress.com/2010/11/17/the-mystery-behind-lunlogical-unit-number/)
  - [SQUEEZE: cat: /proc/scsi/scsi: No such file or directory](https://www.linuxquestions.org/questions/debian-26/squeeze-cat-proc-scsi-scsi-no-such-file-or-directory-805890/)
  - [HOWTO: Add, Resize and Remove LUN without restarting SLES \| Support \| SUSE](https://www.suse.com/support/kb/doc/?id=000017762)

## System upgrade

Run the following commands:

```bash
zypper refresh
zypper dist-upgrade
```

To prevent potential unwanted packages from being installed:

- `--no-recommends` flag can be used for `dist-upgrade` to install required packages only, referring to [the Reddit post](https://www.reddit.com/r/openSUSE/comments/10rnrnu/zypper_keeps_installing_kde_games_on_update_how/) and [the blog](https://linuxkamarada.com/en/2021/04/07/what-are-recommended-packages-and-how-to-install-them-on-opensuse/).
- Locks can used. See [[openSUSE/package#Lock]].

*References*:

- [SDB:System upgrade](https://en.opensuse.org/SDB:System_upgrade)
- [SDB:Offline upgrade](https://en.opensuse.org/SDB:Offline_upgrade)

### Upgrade failures

- [Chromium and chromium based browsers (Vivaldi) not displaying content correctly - English / Applications - openSUSE Forums](https://forums.opensuse.org/t/chromium-and-chromium-based-browsers-vivaldi-not-displaying-content-correctly/167660/2)

## Package management

See [[openSUSE/package]].

## Shell & terminal

### Bash alias

See [[Linux/Bash#Alias]] for generic Bash alias usages. The following is my `.bash_aliases` for openSUSE Tumbleweed:

```bash
#!/bin/bash
# sudo related
alias asudo='sudo '                                # able to use aliases
alias esudo='sudo --preserve-env env "PATH=$PATH"' # able to use user PATH

# zypper related
alias sz='sudo zypper'
alias z='zypper'

# AppImages
APPIMAGE_DIR="$HOME/bin/AppImage"
alias Eudic='$APPIMAGE_DIR/eudic.AppImage'
alias Ganache='$APPIMAGE_DIR/ganache-2.7.1-linux-x86_64.AppImage'
alias QQ='$APPIMAGE_DIR/QQ_3.2.7_240403_x86_64_01.AppImage'

# Clash
alias clash='$HOME/.clash/cfw'

# eza
alias e='eza -lF --no-quotes -a -g --time-style iso'
alias eT='eza -lF --no-quotes -g --time-style iso -T --level'

# flatpak related
alias fpk='flatpak'
alias HandBrake='flatpak run fr.handbrake.ghb'
alias OpenSpades='__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia flatpak run jp.yvt.OpenSpades'
alias Steam='flatpak run com.valvesoftware.Steam'

# KVM
alias vstart='sudo systemctl start libvirtd.service
&& systemctl status libvirtd.service
&& sudo virsh net-start default
&& sudo virsh net-list --all
&& virt-manager'
alias vattach='sudo virsh attach-device'
alias vdetach='sudo virsh detach-device'
alias lgc='looking-glass-client -m KEY_HOME'

# NVidia related
alias nv='__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia'

# WARP
alias warp='warp-cli -vvv'
alias warpc='warp-cli -vvv connect'
alias warpd='warp-cli -vvv disconnect'

# misc
alias du='du --human-readable'
alias FreeTube='flatpak run io.freetubeapp.FreeTube'
alias frp='$HOME/.frp/frpc --config $HOME/.frp/frpc.ini'
alias languagetool='docker run -d --rm -p 8081:8010 --name languagetool silviof/docker-languagetool'
alias rm='rm --interactive=once'
alias studio='/opt/android-studio/bin/studio.sh'
alias trash='gio trash'
alias xt='exit'
```

*References*:

- [Command not found when using sudo](https://stackoverflow.com/questions/12996397/command-not-found-when-using-sudo)
- [Why does `sudo env "PATH=$PATH"` do anything at all?](https://superuser.com/questions/1551566/why-does-sudo-env-path-path-do-anything-at-all)
- [Aliases not available when using sudo](https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo)

### Starship

1. Install CMake by `sudo zypper install cmake`.
2. Install Rust. See [[openSUSE/dev-env#Rust]].
3. Then install starship by `cargo install starship --locked`.
4. See [[shell-tools#Starship]] for configuration.

*References*:

- [🚀 Installation](https://starship.rs/guide/#%F0%9F%9A%80-installation)

### WezTerm

1. Installation: See [[openSUSE/package#WezTerm]].
2. Configuration: See [[terminal-tools#WezTerm]].

### Zellij

See [[terminal-tools#Zellij]].

## NVIDIA graphics card

### Install driver and prime-select

1. Add NVidia's repository. See [[openSUSE/package#Packman (essentials) and NVidia]].
2. Install drivers. On my machine (*ThinkPad P1 Gen2 with T2000*), I tested 2 methods:
   - Install legacy driver `x11-video-nvidiaG05` and `suse-prime`.
   - Install the current driver `nvidia-video-G06` (or `nvidia-drivers-G06`) and `suse-prime`. At the time of updating (*Tumbleweed 20230518, KDE Plasma 5.27.5, NV driver 525.116.04*), it may result in a black SDDM login screen with only the cursor, which might be solved by pressing `Ctrl` + `Alt` + `Backspace` twice to restart the X server.
3. Disable `nvidia-powerd` service because it's for Ampere or newer GPUs:

   ```bash
   sudo systemctl stop nvidia-powerd
   sudo systemctl disable nvidia-powerd
   sudo systemctl mask nvidia-powerd
   ```

*References*:

- https://opensuse.github.io/openSUSE-docs-revamped-temp/hybrid_graphics/
- [SDB:NVIDIA drivers](https://en.opensuse.org/SDB:NVIDIA_drivers)
- [SDB:NVIDIA the hard way - openSUSE Wiki](https://en.opensuse.org/SDB:NVIDIA_the_hard_way)
- [SDB:NVIDIA troubleshooting](https://en.opensuse.org/SDB:NVIDIA_troubleshooting)
- [SDB:NVIDIA SUSE Prime](https://en.opensuse.org/SDB:NVIDIA_SUSE_Prime)
- [NVIDIA Open GPU kernel modules: openSUSE/SLE packages available \| Stefan’s openSUSE Blog](https://sndirsch.github.io/nvidia/2022/06/07/nvidia-opengpu.html)
- [7.4 Switching between Intel and NVIDIA Optimus GPUs with SUSE Prime](https://doc.opensuse.org/documentation/leap/reference/single-html/book-reference/index.html#sec-gui-desktop-suse-prime)
- [来到opensuse15.3的世界后，我推荐你做点什么](https://www.bwsl.wang/script/129.html)
- [Got a black screen with mouse cursor only after switching (on SDDM screen) a user session type between X11 and Wayland](https://forum.manjaro.org/t/got-a-black-screen-with-mouse-cursor-only-after-switching-on-sddm-screen-a-user-session-type-between-x11-and-wayland/87044/3)
- [Chapter 23. Dynamic Boost on Linux](https://download.nvidia.com/XFree86/Linux-x86_64/550.90.07/README/dynamicboost.html)
- [GPU Stops working randomly / Laptop Issues / Arch Linux Forums](https://bbs.archlinux.org/viewtopic.php?id=291877)
- [/usr/bin/nvidia-powerd[1118]: SBIOS support not found for NVPCF GET_SUPPORTED function - Graphics / Linux / Linux - NVIDIA Developer Forums](https://forums.developer.nvidia.com/t/usr-bin-nvidia-powerd-1118-sbios-support-not-found-for-nvpcf-get-supported-function/220662)

### NVIDIA module not loaded

*References*:

- [NVIDIA module not loaded : r/openSUSE](https://www.reddit.com/r/openSUSE/comments/ydfdd5/nvidia_module_not_loaded/)

### Make applications run on NVIDIA card

Use `__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia SOME_APP_COMMAND`.

*References*:

- [Chapter 35. PRIME Render Offload](https://download.nvidia.com/XFree86/Linux-x86_64/525.116.04/README/primerenderoffload.html)
- [2.2.2 Configure applications to render using GPU](https://wiki.archlinux.org/title/PRIME#Configure_applications_to_render_using_GPU)
- [Prime-run command not found](https://askubuntu.com/questions/1364762/prime-run-command-not-found)
- [Prime-run on Ubuntu, openSUSE, and Fedora (Nvidia & Linux)](https://www.youtube.com/watch?v=aPi8NfDyDMU)

### If graphics driver or graphical desktop does not work

- Press `Ctrl+Alt+F4` to switch to virtual terminal 4.
- Press `Ctrl+Alt+F2` to switch back to the graphical desktop.
- Completely uninstall `nvidia-video-G06` (or `nvidia-drivers-G06`) via the following commands:

  ```bash
  zypper remove --clean-deps nvidia-drivers-G06 nvidia-video-G06 nvidia-driver-G06-kmp-default
  ```

*References*:

- [Accessing a TTY](https://www.howtogeek.com/428174/what-is-a-tty-on-linux-and-how-to-use-the-tty-command/#accessing-a-tty)
- [How to Access TTY in Linux?](https://itsfoss.com/what-is-tty-in-linux/#how-to-access-tty-in-linux)
- [The TTY demystified](https://www.linusakesson.net/programming/tty/index.php)
- [How to restart X and kde properly?](https://forums.opensuse.org/t/how-to-restart-x-and-kde-properly/61879)
- [Restart KDE in Kubuntu](https://www.maketecheasier.com/restart-frozen-desktop-linux/#restart-kde-kubuntu)

### Benchmark

*References*:

- [Benchmarking - ArchWiki](https://wiki.archlinux.org/title/benchmarking#Graphics)

## Codecs

Some libraries are needed to enable Firefox to play HTML5 videos.

- For my machine I just installed the following packages from the *Packman* repository:

  ```text
  libavcodec56
  libavcodec57
  libavcodec58
  libavformat56
  libavformat57
  libavformat58
  libavdevice56
  libavdevice57
  libavdevice58
  ```

- Or use `opi codecs`.

*References*:

- [SDB:Firefox MP4/H.264 Video Support - openSUSE Wiki](https://en.opensuse.org/SDB:Firefox_MP4/H.264_Video_Support)
- [SDB:Installing codecs from Packman repositories](https://en.opensuse.org/SDB:Installing_codecs_from_Packman_repositories)
- https://opensuse.github.io/openSUSE-docs-revamped-temp/codecs/
- [some youtube videos don't play on firefox](https://www.reddit.com/r/openSUSE/comments/u0myze/some_youtube_videos_dont_play_on_firefox/)
- [openSUSE Simplifies Codec Installation](https://news.opensuse.org/2023/01/24/opensuse-simplifies-codec-install/)
- [I've been using OpenSuse Tumbleweed for 40 days. My experience. Great for gaming.](https://www.youtube.com/watch?v=owOSnus9XU0)
- [Codecs, it's easier to install them than you think. (Opi) : openSUSE](https://www.reddit.com/r/openSUSE/comments/p6q60u/codecs_its_easier_to_install_them_than_you_think/)

## Touchpad gestures

*References*:

- [JoseExposito/touchegg: Linux multi-touch gesture recognizer](https://github.com/JoseExposito/touchegg)

## Fingerprint

1. Check whether the device is supported on [the official site](https://fprint.freedesktop.org/supported-devices.html). Unsupported devices can be found [here](https://gitlab.freedesktop.org/libfprint/wiki/-/wikis/Unsupported%20Devices).

   USB Device info can be checked via `lsusb` or *Info Center > Devices > USB Devices*.
2. Install `fprintd` and `fprintd-pam`.
3. Add the following config to `/etc/pam.d/sddm`:

   ```text
   #%PAM-1.0
   auth     [success=1 new_authtok_reqd=1 default=ignore]   pam_unix.so try_first_pass likeauth nullok
   auth     sufficient      pam_fprintd.so
   ```

   **NOTE**: You may have to re-config `/etc/pam.d/sddm` after system updates. Refer to [the official wiki](https://en.opensuse.org/SDB:Facial_authentication#Known_issues).

4. Add the following config to `/etc/pam.d/kde` (create the file if there is no such file):

   ```text
   auth 			sufficient  	pam_unix.so try_first_pass likeauth nullok
   auth 			sufficient  	pam_fprintd.so
   ```

*References*:

- [SDB:Using fingerprint authentication](https://en.opensuse.org/SDB:Using_fingerprint_authentication)

## IR camera

- [ ] set up facial auth

*References*:

- [SDB:Facial authentication](https://en.opensuse.org/SDB:Facial_authentication)

## Bluetooth

See [[linux/tips#Use the Same Bluetooth Device on Linux and Windows Dual Boot System]].

## Fonts

See [[fonts#Chinese]] for better Chinese character support..

## Locale

Change the system lock screen time format to 24H by adding `LC_TIME=C.UTF-8` to `/etc/locale.conf`.

*References*:

- [Locale - ArchWiki](https://wiki.archlinux.org/title/Locale)
- [How to display KDE lock screen time in 24-hour format](https://askubuntu.com/questions/783184/how-to-display-kde-lock-screen-time-in-24-hour-format)
- [Changing the lock screen clock theme](https://forum.manjaro.org/t/changing-the-lock-screen-clock-theme/114424)
- [Change time format in KDE Lock Screen](https://www.reddit.com/r/kde/comments/kxr9qz/change_time_format_in_kde_lock_screen/)

## Input method

### Rime

1. Use `zypper install fcitx5-rime` to install.
2. See [[rime#User config]] for configuration.

**Note**:

- `fcitx5-rime` is not responsible for the front end, which means `fcitx5.custom.yaml` does not control the look of the skin.
- At the time of writing (*Tumbleweed 20230322, KDE Plasma 5.27.3*), in order to display emojis correctly in the candidate list, add the following content to `~/.config/fontconfig/fonts.conf`:

  ```xml
  <match target="font">
      <test name="family" compare="contains">
          <string>Emoji</string>
      </test>
      <edit name="hinting" mode="assign">
          <bool>true</bool>
      </edit>
      <edit name="hintstyle" mode="assign">
          <const>hintslight</const>
      </edit>
      <edit name="embeddedbitmap" mode="assign">
          <bool>true</bool>
      </edit>
  </match>
  ```

*References*:

- [下載及安裝](https://rime.im/download/)
- [RIME support for Fcitx](https://github.com/fcitx/fcitx-rime)
- [arch + fcitx5 不显示emoji？ #50](https://github.com/fkxxyz/rime-cloverpinyin/issues/50#issuecomment-835390794)
- [Bug 104542 - Color emojis are not displayed](https://bugs.freedesktop.org/show_bug.cgi?id=104542)
- [fonts-conf](https://www.freedesktop.org/software/fontconfig/fontconfig-user.html)

## Power management

See [[power]] for power saving config.

## Fan control

*References*:

- [How to control fan speed - ThinkWiki](https://www.thinkwiki.org/wiki/How_to_control_fan_speed)
- [How to control ThinkPad P14s' fan speed in Linux - Monosoul's Dev Blog](https://blog.monosoul.dev/2021/10/17/how-to-control-thinkpad-p14s-fan-speed-in-linux/)
- [How to manually change fan speed on a thinkpad? : r/linuxquestions](https://www.reddit.com/r/linuxquestions/comments/t4v49g/how_to_manually_change_fan_speed_on_a_thinkpad/?rdt=56743)

## Grub2 theme

1. Download a theme from [*Preview / Wiki - Adrian Środoń*](https://k1ng.dev/distro-grub-themes/preview).
2. Unpack it and place the theme folder under `/boot/grub2/themes/`.
3. Use *YaST* to choose the `.txt` file.

## KDE tweak

See [[KDE]].

## Mouse

### Disable middle click

See [[Xorg#Disable the middle click pasting]].

### Scroll speed

See [[KDE#Mouse wheel scroll speed]].

## Boot parameters

At the time of writing (*Tumbleweed 20230605, kernel 6.3.4-1-default*), the default boot parameters are:

```text
splash=silent resume=/dev/disk/by-uuid/SWAP_UUID quiet security=apparmor nosimplefb=1
```

I modified the boot parameters to the following:

```text
resume=/dev/disk/by-uuid/SWAP_UUID security=apparmor nosimplefb=1
```

See [[linux/tips#Boot Parameters]] for parameter meanings.

*References*:

- [SDB:Changing the Splash Screen's Default Settings](https://tr.opensuse.org/SDB:Changing_the_Splash_Screen%27s_Default_Settings)
- [Modifying kernel boot parameters](https://documentation.suse.com/smart/systems-management/html/task-modify-kernel-boot-parameter/index.html)
- [Grub boot options.](https://forums.opensuse.org/t/grub-boot-options/79823)

## zram

*References*:

- [zram: Compressed RAM based block devices](https://www.kernel.org/doc/Documentation/blockdev/zram.txt)
- [5.14.9 zram is now officially supported](https://www.suse.com/releasenotes/x86_64/SUSE-SLES/15-SP4/index.html#jsc-SLE-18818)
- [Deprecated by systemd/zram-generator #7](https://github.com/mdomlop/systemd-zram/issues/7)
- [Systemd unit generator for zram devices](https://github.com/systemd/zram-generator)

## Development environment

See [[openSUSE/dev-env]].

## Gaming

See [[gaming]].

## Printers

### HP

It seems these packages provide drivers that cannot be searched by default. Maybe installing the exact package(s) that provide drivers is sufficient.

```log
az@az-P1-openSUSE:~> sz in hplip
Loading repository data...
Reading installed packages...
Resolving package dependencies...

The following 2 recommended packages were automatically selected:
  libqt5-qtconnectivity-tools python311-reportlab

The following 23 NEW packages are going to be installed:
  hplip hplip-hpijs hplip-sane hplip-udev-rules libQt5Bluetooth5 libQt5Bluetooth5-imports libQt5Designer5 libQt5Help5
  libQt5Location5 libQt5Multimedia5 libQt5Nfc5 libQt5Nfc5-imports libQt5OpenGL5 libQt5PositioningQuick5
  libqt5-qtconnectivity-tools libQt5SerialPort5 libQt5WebSockets5 libQt5WebSockets5-imports python311-olefile python311-Pillow
  python311-qt5 python311-qt5-sip python311-reportlab

23 new packages to install.

Package download size:    37.4 MiB

Package install size change:
              |      91.8 MiB  required by to be installed packages
    91.8 MiB  |  -      0 B    released by to be removed packages

Backend:  classic_rpmtrans
Continue? [y/n/v/...? shows all options] (y): y
```

```log
✗ sz install hplip
Loading repository data...
Reading installed packages...
Resolving package dependencies...

The following 2 recommended packages were automatically selected:
  libqt5-qtconnectivity-tools python311-reportlab

The following 21 NEW packages are going to be installed:
  hplip hplip-hpijs hplip-sane hplip-udev-rules libQt5Bluetooth5 libQt5Bluetooth5-imports libQt5Designer5 libQt5Help5
  libQt5Location5 libQt5Nfc5 libQt5Nfc5-imports libQt5PositioningQuick5 libqt5-qtconnectivity-tools libQt5SerialPort5
  libQt5WebSockets5 libQt5WebSockets5-imports python311-olefile python311-Pillow python311-qt5 python311-qt5-sip
  python311-reportlab

21 new packages to install.
Overall download size: 36.4 MiB. Already cached: 0 B. After the operation, additional 85.7 MiB will be used.
Continue? [y/n/v/...? shows all options] (y): y
```

Only installing `hplip-hpijs` is not sufficient.

```log
﬌ sz install hplip-hpijs
Loading repository data...
Reading installed packages...
Resolving package dependencies...

The following package is suggested, but will not be installed:
  hplip

The following 3 NEW packages are going to be installed:
  hplip-hpijs hplip-sane hplip-udev-rules

3 new packages to install.
Overall download size: 6.5 MiB. Already cached: 0 B. After the operation, additional 10.2 MiB will be used.
Continue? [y/n/v/...? shows all options] (y): y
```

## Hotspot

### Use `linux-wifi-hotspot`

1. Install dependencies via the following commands:

    ```bash
    zypper install bash procps hostapd iproute2 iw haveged dnsmasq iptables
    ```

    *References*:

    - https://github.com/lakinduakash/linux-wifi-hotspot/tree/master#dependencies

2. Install dependencies for building via the following commands:

    ```bash
    zypper install qrencode-devel
    ```

3. [ ] todo

[//begin]: # "Autogenerated link references for markdown compatibility"
[openSUSE/package#Lock]: package.md "openSUSE Package Management"
[openSUSE/package]: package.md "openSUSE Package Management"
[Linux/Bash#Alias]: ../Bash.md "Bash Usage"
[openSUSE/dev-env#Rust]: dev-env.md "openSUSE Development Environment"
[shell-tools#Starship]: ../shell-tools.md "Shell Related Tools"
[openSUSE/package#WezTerm]: package.md "openSUSE Package Management"
[terminal-tools#WezTerm]: ../terminal-tools.md "Terminal Related Tools"
[terminal-tools#Zellij]: ../terminal-tools.md "Terminal Related Tools"
[openSUSE/package#Packman (essentials) and NVidia]: package.md "openSUSE Package Management"
[linux/tips#Use the Same Bluetooth Device on Linux and Windows Dual Boot System]: ../tips.md "General Linux Usage Tips"
[fonts#Chinese]: ../../fonts.md "Fonts"
[rime#User config]: ../../rime.md "RIME | 中州韻輸入法引擎"
[power]: ../power.md "Power Management"
[KDE]: ../KDE.md "KDE Plasma Tweak"
[Xorg#Disable the middle click pasting]: ../Xorg.md "X.Org"
[KDE#Mouse wheel scroll speed]: ../KDE.md "KDE Plasma Tweak"
[linux/tips#Boot Parameters]: ../tips.md "General Linux Usage Tips"
[openSUSE/dev-env]: dev-env.md "openSUSE Development Environment"
[gaming]: ../gaming.md "Gaming on Linux"
[//end]: # "Autogenerated link references"
