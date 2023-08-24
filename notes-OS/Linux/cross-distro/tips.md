# General Linux Usage Tips

Last modified: 2023/08/24 15:54:42

## Boot Parameters

*References*:

- [v6.4](https://www.kernel.org/doc/html/v6.4/admin-guide/kernel-parameters.html)
- [Kernel parameters - ArchWiki](https://wiki.archlinux.org/title/kernel_parameters)
- [What do the nomodeset, quiet and splash kernel parameters mean?](https://askubuntu.com/questions/716957/what-do-the-nomodeset-quiet-and-splash-kernel-parameters-mean)

## Use the Same Bluetooth Device on Linux and Windows Dual Boot System

1. Pair to Linux.
2. Pair to Windows. Go to registry and export `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\BTHPORT\Parameters\Keys`.
3. On Linux, change the `[LinkKey]` section of `/var/lib/bluetooth/<ADAPTOR_MAC_ADDRESS>/<DEVICE_MAC_ADDRESS>/info`.
4. Reboot or `sudo systemctl restart bluetooth`.

*References*:

- [Bluetooth Pairing on Dual Boot of Windows & Linux Mint/Ubuntu - Stop having to Pair Devices](https://unix.stackexchange.com/questions/255509/bluetooth-pairing-on-dual-boot-of-windows-linux-mint-ubuntu-stop-having-to-p)
- [Guide: Pair and use the same Bluetooth device on both Windows and Pop!_OS when dual booting, without needing to re-pair every time you switch OS.](https://www.reddit.com/r/pop_os/comments/lf8kvu/guide_pair_and_use_the_same_bluetooth_device_on/)

## Trusted Platform Module

### Check support

*References*:

- [2.1 Checking support](https://wiki.archlinux.org/title/Trusted_Platform_Module#Checking_support)
- [How to determine if computer has TPM (Trusted Platform Module) available](https://unix.stackexchange.com/questions/341629/how-to-determine-if-computer-has-tpm-trusted-platform-module-available)
