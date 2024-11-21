---
sitemap:
  lastmod: 2024-11-21 +0000
---

# Storage & File System

Last modified: 2024-11-21 +0000

- [Interesting posts](#interesting-posts)
- [Permissions](#permissions)
- [Logical Volume Manager](#logical-volume-manager)
- [Btrfs](#btrfs)
- [exFAT](#exfat)
  - [Utility installation](#utility-installation)
- [SquashFS](#squashfs)

## Interesting posts

- [Filesystem Hierarchy Standard](https://www.linuxbase.org/betaspecs/fhs/fhs/index.html)
- [FHS Referenced Specifications](https://refspecs.linuxfoundation.org/fhs.shtml)
- [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
- [Linux directory structure:/etc explained - The Linux Juggernaut](https://www.linuxnix.com/linux-directory-structure-explainedetc-folder/)
- [Where should a local executable be placed?](https://unix.stackexchange.com/questions/36871/where-should-a-local-executable-be-placed)
- [Use the XDG standard bin directory on linux?](https://github.com/JuliaLang/juliaup/issues/247)
- [Where should standalone and custom-built binaries be put? In /opt/ or in $HOME/path/to/dir ? : r/debian](https://www.reddit.com/r/debian/comments/1azttn6/where_should_standalone_and_custombuilt_binaries/)
- [What does `/opt` mean in Linux?](https://www.baeldung.com/linux/opt-directory)
- [directory structure - What is the difference between /opt and /usr/local? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/11544/what-is-the-difference-between-opt-and-usr-local)
- [What happens when you delete a file in Linux? \| Enable Sysadmin](https://www.redhat.com/sysadmin/linux-delete-file-rm)
- [Where do files go when the rm command is issued? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/10883/where-do-files-go-when-the-rm-command-is-issued)
- [partitioning - How do I find out what filesystem my partitions are using? - Ask Ubuntu](https://askubuntu.com/questions/309047/how-do-i-find-out-what-filesystem-my-partitions-are-using)

## Permissions

*References*:

- [Advanced File Permissions in Linux \| Baeldung on Linux](https://www.baeldung.com/linux/advanced-file-permissions)
- [Directory permissions "r-s", chmod 655 does not change to "r-x", why? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/263342/directory-permissions-r-s-chmod-655-does-not-change-to-r-x-why)

## Logical Volume Manager

*References*:

- [Logical Volume Manager (LVM) versus standard partitioning in Linux \| Enable Sysadmin](https://www.redhat.com/sysadmin/lvm-vs-partitioning)
- [How to add an extra second hard drive on Linux LVM and increase the size of storage - nixCraft](https://www.cyberciti.biz/faq/howto-add-disk-to-lvm-volume-on-linux-to-increase-size-of-pool/)
- [How to add a new LVM volumes for full and partial disk usage](https://www.techrepublic.com/article/how-to-new-lvm-volumes/)

## Btrfs

*References*:

- [Btrfs - ArchWiki](https://wiki.archlinux.org/title/Btrfs)
- [Resizing file systems](https://documentation.suse.com/sles/15-SP4/html/SLES-all/cha-resize-fs.html)
- [Expert Partitioner](https://documentation.suse.com/sles/15-SP4/html/SLES-all/cha-expert-partitioner.html)

## exFAT

### Utility installation

- openSUSE Tumbleweed: Install `exfatprogs` via `zypper install exfatprogs`.

## SquashFS

*References*:

- [The SquashFS tools exposed](https://tldp.org/HOWTO/SquashFS-HOWTO/mksqoverview.html)
