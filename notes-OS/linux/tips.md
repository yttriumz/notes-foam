---
sitemap:
  lastmod: 2025-04-03 +0000
---

# General Linux Usage Tips

Last modified: 2025-04-03 +0000

- [Fix missing BIOS boot entry](#fix-missing-bios-boot-entry)
- [Use the Same Bluetooth Device on Linux and Windows Dual Boot System](#use-the-same-bluetooth-device-on-linux-and-windows-dual-boot-system)
- [User management](#user-management)

## Fix missing BIOS boot entry

To solve [the "wrong efi variable" problem](https://discord.com/channels/366985425371398146/366987951734784012/1161915201029939221):

1. Boot into an live system with `efibootmgr` installed.
2. Create new variable bootnum and add to bootloader: `efibootmgr --create --disk <DEV_PATH_TO_YOUR_EFI_PARTITION> --loader <PATH_TO_YOUR_EFI_APPLICATION> --label "A_NAME_YOU_LIKE" --unicode`

   Specifically I used: `efibootmgr --create --disk /dev/nvme0n1p1 --part 1 --loader "\EFI\opensuse\shim.efi" --label "openSUSE" --unicode`

*References*:

- [efibootmgr - Gentoo wiki](https://wiki.gentoo.org/wiki/Efibootmgr)
- [Unified Extensible Firmware Interface - ArchWiki](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface#efibootmgr)
- [EFI boot stub - ArchWiki](https://wiki.archlinux.org/title/EFI_boot_stub#efibootmgr)
- [Use Linux efibootmgr Command to Manage UEFI Boot Menu - LinuxBabe](https://www.linuxbabe.com/command-line/how-to-use-linux-efibootmgr-examples)

## Use the Same Bluetooth Device on Linux and Windows Dual Boot System

1. Pair to Linux.
2. Pair to Windows. Go to registry and export `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\BTHPORT\Parameters\Keys`.
3. On Linux, change the `[LinkKey]` section of `/var/lib/bluetooth/<ADAPTOR_MAC_ADDRESS>/<DEVICE_MAC_ADDRESS>/info`.
4. Reboot or `sudo systemctl restart bluetooth`.

*References*:

- [Bluetooth Pairing on Dual Boot of Windows & Linux Mint/Ubuntu - Stop having to Pair Devices](https://unix.stackexchange.com/questions/255509/bluetooth-pairing-on-dual-boot-of-windows-linux-mint-ubuntu-stop-having-to-p)
- [Guide: Pair and use the same Bluetooth device on both Windows and Pop!_OS when dual booting, without needing to re-pair every time you switch OS.](https://www.reddit.com/r/pop_os/comments/lf8kvu/guide_pair_and_use_the_same_bluetooth_device_on/)

## User management

- Change username: `usermod -l NEW_USERNAME OLD_USERNAME`
- Change user's home directory: `usermod -d PATH_TO_NEW_HOME -m USER`
