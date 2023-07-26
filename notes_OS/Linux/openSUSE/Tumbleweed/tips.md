# openSUSE Usage Tips

## Switch runlevel

*References*:

- https://en.opensuse.org/SDB:Switch_runlevel

## System frozen

On my machine (*ThinkPad P1 Gen2*), hold `Left Alt` + `PrtSc` and then press `r`, `s`, `e`, `i`, `u`, `b` to reboot the system.

*References*:

- [How to debug a hung system with SysRq keys](https://www.suse.com/support/kb/doc/?id=000020294)
- [What should I do when Ubuntu freezes?](https://askubuntu.com/questions/4408/what-should-i-do-when-ubuntu-freezes)

## Check x86-64 microarchitecture levels

Use the following commands:

```bash
/usr/lib64/ld-linux-x86-64.so.2 --help
```

*References*:

- https://news.opensuse.org/2023/03/23/gcc-efibm-up-in-tw/
- https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level#
- https://www.reddit.com/r/linuxhardware/comments/s2x60j/how_do_i_know_if_my_cpu_supports_x86_64v3/
- https://unix.stackexchange.com/questions/631217/how-do-i-check-if-my-cpu-supports-x86-64-v2

## Connect Android phones

- Install `mtpfs` and `mtp-tools`.
- Or install `android-file-transfer`.

*References*:

- [Opening Phone in MTP Mode (Leap 15.2)](https://www.reddit.com/r/openSUSE/comments/nnjrg8/opening_phone_in_mtp_mode_leap_152/)
- [USB连接说明](http://www.vivo.com.cn/instructions/index?scrollTop&modelName=PD1709&pageId=25003&modelNameExt=X20&androidVersion=1.0&funtouchVersion=1.0)
- [Android File Transfer for Linux](https://github.com/whoozle/android-file-transfer-linux)
