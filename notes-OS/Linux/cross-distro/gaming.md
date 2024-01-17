# Gaming on Linux

Last modified: 2024/01/17 UTC

- [Interesting posts](#interesting-posts)
- [Steam (Flatpak)](#steam-flatpak)
  - [Installation](#installation)
  - [Steam Play settings](#steam-play-settings)
  - [Play non-Steam games using Proton (Flatpak)](#play-non-steam-games-using-proton-flatpak)
  - [Launch options template](#launch-options-template)
  - [Cyberpunk 2077](#cyberpunk-2077)
    - [Graphics options (T2000)](#graphics-options-t2000)
    - [Game save](#game-save)
  - [Gene Shift Auto](#gene-shift-auto)
    - [Minimal working launch options](#minimal-working-launch-options)
  - [Dead Island 2](#dead-island-2)
    - [Graphics options (T2000)](#graphics-options-t2000-1)
    - [Game save](#game-save-1)
    - [Save editor](#save-editor)
  - [Outer Wilds](#outer-wilds)
    - [Graphics options (T2000)](#graphics-options-t2000-2)
    - [Game save](#game-save-2)
  - [Super Animal Royale](#super-animal-royale)
    - [Minimal working launch options](#minimal-working-launch-options-1)
  - [theHunter: Call of the Wild](#thehunter-call-of-the-wild)
    - [Minimal working launch options](#minimal-working-launch-options-2)
- [KVM](#kvm)
- [Lutris](#lutris)
- [OpenSpades (Flatpak)](#openspades-flatpak)
  - [Tips](#tips)

## Interesting posts

- [What games do you play on openSuse?](https://www.reddit.com/r/openSUSE/comments/10ubemu/what_games_do_you_play_on_opensuse/)

## Steam (Flatpak)

### Installation

1. Install via `flatpak install flathub com.valvesoftware.Steam`.
   - For controller support, install drivers via `zypper install steam-devices`.
   - Optionally install Chinese font `wqy-zenhei`.
     - OpenSUSE Tumbleweed: `zypper install wqy-zenhei-fonts`.
   - Optionally set environment to make Steam running using NVIDIA card via `flatpak override --user --env='__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia' com.valvesoftware.Steam`.
2. Run via `flatpak run com.valvesoftware.Steam`.

*References*:

- [Steam](https://flathub.org/en-GB/apps/com.valvesoftware.Steam)
- [My controller isn't being detected](https://github.com/flathub/com.valvesoftware.Steam/wiki#my-controller-isnt-being-detected)
- [Is there any real “disadvantages” to using the FlatPak version of Steam?](https://www.reddit.com/r/linux_gaming/comments/rp2ss9/is_there_any_real_disadvantages_to_using_the/)
- [Linux steam client cannot display Chinese character.](https://www.reddit.com/r/linux_gaming/comments/13xag7z/linux_steam_client_cannot_display_chinese/)
- [4. 以Nvidia PRIME啟動Flatpak版Steam遊戲](https://ivonblog.com/posts/linux-nvidia-prime/#4-%E4%BB%A5nvidia-prime%E5%95%9F%E5%8B%95flatpak%E7%89%88steam%E9%81%8A%E6%88%B2)

### Steam Play settings

Old interface:

![old](attachments/gaming/steam_play_settings.png)

New interface:

![new](attachments/gaming/steam_play_settings_new.png)

### Play non-Steam games using Proton (Flatpak)

1. Put game files under `$HOME/.var/app/com.valvesoftware.Steam/non-Steam/`.
2. Select the game executable in Steam.
3. Configure Steam Play for the game.

*References*:

- [How to add & play non-Steam games on Steam (on Linux with Proton)](https://www.youtube.com/watch?v=ZXPsIRGZizw)

### Launch options template

Use the following template:

```text
GAMEMODERUNEXEC="env __NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia DXVK_FILTER_DEVICE_NAME="T2000" DXVK_FRAME_RATE=60 DXVK_ASYNC=1" gamemoderun %command%
```

*References*:

- [Improving Performance](https://www.protondb.com/help/improving-performance)
- [\[SOLVED\]Proton/Steam is using the wrong GPU - two same Nvidia GPUs](https://bbs.archlinux.org/viewtopic.php?id=282617)
- [If You Are Using Nvidia Here Is Your Standard Launch Preset For Every Game](https://www.reddit.com/r/linux_gaming/comments/zgxyj2/if_you_are_using_nvidia_here_is_your_standard/)
- [WARNING FOR MULTI GPU USERS - You HAVE to specify your GPU to DXVK](https://www.reddit.com/r/linux_gaming/comments/v0nbot/warning_for_multi_gpu_users_you_have_to_specify/)
- [Runtime Config Options](https://github.com/ValveSoftware/Proton#runtime-config-options)
- [Device filter](https://github.com/doitsujin/dxvk#device-filter)
- [Frame rate limit](https://github.com/doitsujin/dxvk#frame-rate-limit)
- [Environment variables](https://github.com/HansKristian-Work/vkd3d-proton#environment-variables)
- [vkd3d: Add VKD3D_FEATURE_LEVEL override. #93](https://github.com/HansKristian-Work/vkd3d-proton/pull/93)
- [DXVK-async = performance boost](https://steamcommunity.com/sharedfiles/filedetails/?id=2809282853)
- [gamemode](https://github.com/FeralInteractive/gamemode)

### Cyberpunk 2077

*References*:

- [How to Run Cyberpunk 2077 on Linux](https://segmentnext.com/cyberpunk-2077-linux/)

#### Graphics options (T2000)

- Limit framerate to 30.
- [ ] todo

#### Game save

Save is located at `%userprofile%\Saved Games\CD Projekt Red\Cyberpunk 2077`.

*References*:

- [Where are my game saves located?](https://support.cdprojektred.com/en/cyberpunk/pc/sp-technical/issue/1706/where-are-my-game-saves-located)

### Gene Shift Auto

#### Minimal working launch options

```text
__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia %command%
```

### Dead Island 2

When playing via Proton, the whole system will crash occasionally. So use [KVM](#kvm) to play it.

#### Graphics options (T2000)

#### Game save

Save is located at `%LocalAppData%\DeadIsland\Saved\SaveGames\DeadIsland2SaveGame.sav`.

#### Save editor

*References*:

- [Dead Island 2 Save Editor](https://steffenl.com/projects/dead-island-2-save-editor)

### Outer Wilds

#### Graphics options (T2000)

- Limit framerate to 45.
- *Shadow Quality* is most GPU-consuming. Set it to *Low*.

#### Game save

Save is located at `%HOMEPATH%\appData\LocalLow\Mobius Digital\Outer Wilds`.

*References*:

- [Support and Troubleshooting Tips](https://www.mobiusdigitalgames.com/supportforum.html)
- [Fix for no menu appears at startup with controller plugged in](https://steamcommunity.com/app/753640/discussions/0/2568690229016081614)
- [星际拓荒XGP存档转steam存档方法](https://www.bilibili.com/read/cv20764437/)
- [【星际拓荒】没有主菜单问题的解决方法](https://www.bilibili.com/read/cv13634330/)

### Super Animal Royale

#### Minimal working launch options

```text
PROTON_USE_WINED3D=1 %command%
```

*References*:

- [Linux Proton issues](https://animalroyale.fandom.com/wiki/Guides/Troubleshooting#Linux_Proton_issues)

### theHunter: Call of the Wild

#### Minimal working launch options

```text
DXVK_FILTER_DEVICE_NAME="T2000" %command% /borderless
```

*References*:

- [Works seamlessly if you tinker with some settings.](https://www.protondb.com/app/518790#Id6WsB9oUy)

## KVM

See [[KVM#Looking Glass]].

## Lutris

*References*:

- [Play all your games on Linux](https://lutris.net/)

## OpenSpades (Flatpak)

- Install via `flatpak install flathub jp.yvt.OpenSpades`.
- Run via `flatpak run jp.yvt.OpenSpades`.

*References*:

- [Play OpenSpades, the open-source voxel first-person shooter](https://openspades.yvt.jp)

### Tips

- You may want to run the game on NV card.
  - See [[tweak-P1-Gen2#Make applications run on NVidia card]].
  - After updating system's native driver, the driver in flatpak should also be updated before running the game.
- To make it run without a window frame, add a rule in *System Settings > Window Management > Window Rules*:

  ![OpenSpades rule](attachments/gaming/openspades_rule.png)

[//begin]: # "Autogenerated link references for markdown compatibility"
[KVM#Looking Glass]: KVM.md "Kernel-based Virtual Machine Usage"
[tweak-P1-Gen2#Make applications run on NVidia card]: ../openSUSE/Tumbleweed/tweak-P1-Gen2.md "Tweak openSUSE Tumbleweed on ThinkPad P1 Gen2"
[//end]: # "Autogenerated link references"
