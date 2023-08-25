# Hard Disk Manipulation

Last modified: 2023/08/24 18:40:17

## Interesting posts

- [Why does the partition start on sector 2048 instead of 63?](https://superuser.com/questions/352572/why-does-the-partition-start-on-sector-2048-instead-of-63)
- [What is the leading 2048 sectors and in the first two partitions?](https://askubuntu.com/questions/1027092/what-is-the-leading-2048-sectors-and-in-the-first-two-partitions)
- [ELI5: Why do partitions start at sector 2048](https://www.reddit.com/r/explainlikeimfive/comments/10kyn3j/eli5_why_do_partitions_start_at_sector_2048/)
- [Recommended UEFI-Based Disk-Partition Configurations](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-7/dd744301(v=ws.10))
- [UEFI/GPT-based hard drive partitions](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/configure-uefigpt-based-hard-drive-partitions?view=windows-11)

## Migrate system

I successfully migrated a data disk for a dual-boot system to a new disk. The steps are recorded on [the post](https://forums.opensuse.org/t/migrating-a-dual-boot-system-to-a-new-disk-best-practices/166948/6):

1. Use Clonezilla Live to clone Disk 2 to the new disk:
   1. Choose device-device mode.
   2. Choose Beginner mode.
   3. Choose disk_to_local_disk.
   4. Choose the correct source and target, then start cloning.
   5. The new disk has the same UUID of each partition as Disk 2.
2. Boot into an openSUSE Leap 15.5 live USB system. Use KDE Partition Manager to resize some of the partitions.
   1. During moving/resizing the swap partition, an error occurred. Therefore I have to wipe the swap partition and create a new swap partition with a new UUID.
   2. Modify `/etc/fstab` for openSUSE Tumbleweed to match the new UUID.
3. Boot into Windows 10.
   - Optionally run `chkdsk D: /r` to verify.
4. Boot into openSUSE Tumbleweed. At the boot menu, update the boot parameter `resume` (for hibernation) to use the UUID of the new swap partition. After booting up, update the boot parameter permanently.
