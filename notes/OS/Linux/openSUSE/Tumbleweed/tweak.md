# Tweak openSUSE Tumbleweed on ThinkPad P1 Gen2

Refer to the following pages:

- https://opensuse.github.io/openSUSE-docs-revamped-temp/best_of_post/
- https://opensuse.github.io/openSUSE-docs-revamped-temp/safety_usability/
- https://averagelinuxuser.com/after-installing-opensuse/

## Change hostname

Change the hostname by the following commands:

```bash
sudo hostnamectl hostname SOME_HOSTNAME
```

## Network settings

### WiFi

- eduroam: refer to [the HKUST ITSC guide]( https://itsc.hkust.edu.hk/services/general-it-services/wifi/wi-fi-services/configuration-eduroam ).

## System update

Run the following commands:

```bash
sudo zypper refresh
sudo zypper dist-upgraded # optionally add "--no-recommends"
```

An option `--no-recommends` can be added referring to [the Reddit post]( https://www.reddit.com/r/openSUSE/comments/10rnrnu/zypper_keeps_installing_kde_games_on_update_how/ ) and [the blog]( https://linuxkamarada.com/en/2021/04/07/what-are-recommended-packages-and-how-to-install-them-on-opensuse/ ).

## Package Management

See [[package]].

## Shell and terminal

### starship

1. Install CMake by `sudo zypper install cmake`.
2. Install Rust. See [[Tumbleweed/dev_env]].
3. Then install starship by `cargo install starship --locked`.
4. See [[starship]] for configuration.

### wezterm

1. Use *YaST* to install the stable version. Refer to [the official doc]( https://wezfurlong.org/wezterm/install/linux.html#installing-on-fedora-and-rpm-based-systems ) for the night version.
2. See [[wezterm]] for configuration.

### Alias

1. Add the following to `.bash_aliases`.

   ```bash
   alias du='du --human-readable'
   alias et='exit'
   alias mysd='sudo --preserve-env env "PATH=$PATH"'
   alias rm='rm -i'
   alias trash='gio trash'
   # zypper related
   alias sdz='sudo zypper'
   alias z='zypper'
   # alias zlu='zypper list-updates'
   # alias zref='sudo zypper refresh'
   alias zse='zypper search --details'
   alias zsei='zypper search --details --installed-only'
   # alias 'z?'='zypper help'
   ```

2. Add the following to `.bashrc`.

   ```bash
   # custom aliases
   if [ -f ~/.bash_aliases ]; then
      . ~/.bash_aliases
   fi
   ```

## Graphics

### Install driver and prime-select

On my machine, I installed `x11-video-nvidiaG05` and `suse-prime`. `nvidia-driver-G06-kmp-default` does not work. But it might work later or on other machines.

Refer to the following pages for more:

- https://opensuse.github.io/openSUSE-docs-revamped-temp/hybrid_graphics/
- https://en.opensuse.org/SDB:NVIDIA_drivers
- https://en.opensuse.org/SDB:NVIDIA_troubleshooting
- https://en.opensuse.org/SDB:NVIDIA_SUSE_Prime
- https://www.bwsl.wang/script/129.html

### Make applications running on NVidia card

Use `__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia APP_COMMAND`.

Refer to the following pages:

- https://wiki.archlinux.org/title/PRIME#Configure_applications_to_render_using_GPU
- https://askubuntu.com/questions/1364762/prime-run-command-not-found
- https://www.youtube.com/watch?v=aPi8NfDyDMU

### Benchmark

Refer to [Arch wiki]( https://wiki.archlinux.org/title/benchmarking#Graphics ).

## Codecs

Refer to [the wiki]( https://en.opensuse.org/SDB:Firefox_MP4/H.264_Video_Support ) to enable firefox to play HTML5 videos. For my machine I just installed the following packages from the *Packman* repository:

- `libavcodec56`, `libavcodec57`, `libavcodec58`, `libavformat56`, `libavformat57`, `libavformat58`, `libavdevice56`, `libavdevice57`, `libavdevice58`

Refer to the following pages for more:

- https://en.opensuse.org/SDB:Installing_codecs_from_Packman_repositories
- https://opensuse.github.io/openSUSE-docs-revamped-temp/codecs/
- https://www.reddit.com/r/openSUSE/comments/u0myze/some_youtube_videos_dont_play_on_firefox/

## Fingerprint

Refer to [the wiki]( https://en.opensuse.org/SDB:Using_fingerprint_authentication ) for more.

1. Install `fprintd` and `fprintd-pam`.
2. Add the following config to `/etc/pam.d/sddm`:

   ```text
   #%PAM-1.0
   auth    [success=1 new_authtok_reqd=1 default=ignore]   pam_unix.so try_first_pass likeauth nullok
   auth    sufficient      pam_fprintd.so
   ```

3. Add the following config to `/etc/pam.d/kde` (create the file if there is no such file):

   ```text
   auth 			sufficient  	pam_unix.so try_first_pass likeauth nullok
   auth 			sufficient  	pam_fprintd.so
   ```

## Bluetooth

See [[cross-distro/bluetooth]].

## Font

<!-- TODO -->

## Locale

Refer to [Arch wiki]( https://wiki.archlinux.org/title/Locale ).

Change the system lock screen time format to 24H by adding `LC_TIME=C.UTF-8` to `/etc/locale.conf`.

Alternatively, refer to these posts:

- https://askubuntu.com/questions/783184/how-to-display-kde-lock-screen-time-in-24-hour-format
- https://forum.manjaro.org/t/changing-the-lock-screen-clock-theme/114424
- https://www.reddit.com/r/kde/comments/kxr9qz/change_time_format_in_kde_lock_screen/

## Input Method

<!-- TODO -->

Refer to the following pages:

- https://rime.im/download/
- https://github.com/fcitx/fcitx-rime

## Grub2 theme

1. Go to https://k1ng.dev/distro-grub-themes/preview and download a theme.
2. Unpack it and place the theme folder under `/boot/grub2/themes/`.
3. Use *YaST* to choose the `.txt` file.

## KDE Plasma

### Widget

- [Event Calendar]( https://store.kde.org/p/998901 )
- [Prime Render Switch and Status]( https://store.kde.org/p/1425330 )

### Change Task Switcher

Open *System Settings* >> *Window Management* >> *Task Switcher* >> Select *Thumbnails*.

## Development environment

See [[Tumbleweed/dev_env]].

[//begin]: # "Autogenerated link references for markdown compatibility"
[package]: package.md "Package Management"
[Tumbleweed/dev_env]: dev_env.md "Development Environment"
[starship]: ../../../cross-platform/starship.md "Starship Config"
[wezterm]: ../../../cross-platform/wezterm.md "Wezterm Config"
[cross-distro/bluetooth]: ../../cross-distro/bluetooth.md "Use the Same Bluetooth Device on Linux and Windows Dual Boot System"
[//end]: # "Autogenerated link references"
