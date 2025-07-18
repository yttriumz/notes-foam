---
sitemap:
  lastmod: 2025-07-02 +0000
---

# WSL 2

Last modified: 2025-07-02 +0000

This post is based on *Windows 11 Pro 24H2* and *WSL 2.5.9.0*, using distro *FedoraLinux-42*.

## Interesting posts

- [双系统的终极方案 - WSL2 - 虾说全栈](http://xiashuo.xyz/posts/devops/linux/wsl/)
- [Back up, restore and duplicate Ubuntu WSL instances - Ubuntu on WSL documentation](https://documentation.ubuntu.com/wsl/latest/howto/backup-and-restore/)

## Repos to add

```bash
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
```

## Packages to install

```txt
crypto-policies-scripts
fd-find
gcc
gcc-c++
git
make
rlwrap
```

## Networking

- Use "Mirrored" instead of "Nat" for WSL 2 VM to access Windows host.
- At the time of writing (*WSL 2.5.9.0*), "Mirrored" network does not work with OpenVPN Client.

*References*:

- [Accessing network applications with WSL \| Microsoft Learn](https://learn.microsoft.com/en-us/windows/wsl/networking)
- [Hyper-V Firewall \| Microsoft Learn](https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/hyper-v-firewall)
- [使用鏡像網路模式(Mirrored Mode)，讓WSL的服務能從外網連線 · Ivon的部落格](https://ivonblog.com/posts/wsl-network-mirrored-mode/)
- [openvpn connection stops working after upgraded to 2.0.9 with mirrored networking · Issue #10879 · microsoft/WSL](https://github.com/microsoft/WSL/issues/10879)

## File system

### File permissions

Enable metadata in `automount` section in `/etc/wsl.conf` (per distro configuration file) for `chmod` to work:

```text
[automount]
options="metadata"
```

*References*:

- [chmod doesn't work? · Issue #81 · microsoft/WSL](https://github.com/microsoft/WSL/issues/81#issuecomment-796798258)
- [Advanced settings configuration in WSL \| Microsoft Learn](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#automount-options)

### Cannot create directory

On Windows, open *File Explorer* and open *Properties* of the target folder. On *Security* tab, add the target user and give *Full control* to the user.

*References*:

- [mkdir: cannot create directory ‘a’: Permission denied · Issue #4836 · microsoft/WSL](https://github.com/microsoft/WSL/issues/4836)

### Case sensitivity

1. Enable case-sensitivity in `automount` section in `/etc/wsl.conf` (per distro configuration file):

   ```text
   [automount]
   options="metadata,case=dir"
   ```

2. Enable case-sensitivity on NTFS (administrative privilege required):

   ```powershell
   fsutil.exe file setCaseSensitiveInfo D:\<PATH>\ enable
   ```

   Note that you cannot change the case sensitivity setting on a directory that contains other files or directories. Try creating a new directory, changing the setting, then copying your mixed-case files into it.

*References*:

- [Case Sensitivity \| Microsoft Learn](https://learn.microsoft.com/en-us/windows/wsl/case-sensitivity#changing-the-case-sensitivity-on-a-drive-mounted-to-a-wsl-distribution)
