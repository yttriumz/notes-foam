# Use the Same Bluetooth Device on Linux and Windows Dual Boot System

Refer to the following posts:

- https://unix.stackexchange.com/questions/255509/bluetooth-pairing-on-dual-boot-of-windows-linux-mint-ubuntu-stop-having-to-p
- https://www.reddit.com/r/pop_os/comments/lf8kvu/guide_pair_and_use_the_same_bluetooth_device_on/

## Steps

1. Pair to Linux.
2. Pair to Windows. Go to registry and export `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\BTHPORT\Parameters\Keys`.
3. Pair to Linux. Change the `[LinkKey]` section of `/var/lib/bluetooth/<ADAPTOR_MAC_ADDRESS>/<DEVICE_MAC_ADDRESS>/info`.
4. Reboot or `sudo systemctl restart bluetooth`.
