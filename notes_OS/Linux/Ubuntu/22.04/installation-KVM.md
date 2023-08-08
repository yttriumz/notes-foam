# Install Ubuntu 22.04 as KVM Guest

## KVM host spec

- Host OS: openSUSE Tumbleweed 20230804
- Host kernel version: 6.4.6-1-default (64-bit)
- `qemu-system-x86_64 --version`:

  ```text
  QEMU emulator version 8.0.3 (openSUSE Tumbleweed)
  Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
  ```

- `virsh --version=long`:

  ```text
  Virsh command line tool of libvirt 9.5.0
  See web site at https://libvirt.org/

  Compiled with support for:
   Hypervisors: QEMU/KVM LXC LibXL ESX Test
   Networking: Remote Network Bridging Interface netcontrol Nwfilter
   Storage: Dir Disk Filesystem SCSI Multipath iSCSI iSCSI-direct LVM RBD Gluster
   Miscellaneous: Daemon Nodedev AppArmor SELinux Secrets Debug DTrace Readline
  ```

- `libvirtd --version`:

  ```text
  libvirtd (libvirt) 9.5.0
  ```
