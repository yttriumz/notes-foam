# Power Management

*References*:

- [Power management - ArchWiki](https://wiki.archlinux.org/title/Power_management)
- [Laptop Mode Tools - ArchWiki](https://wiki.archlinux.org/title/Laptop_Mode_Tools)
- [CPU frequency scaling - ArchWiki](https://wiki.archlinux.org/title/CPU_frequency_scaling)
- [auto-cpufreq](https://github.com/AdnanHodzic/auto-cpufreq)
- [Laptop Mode Tools README](https://github.com/rickysarraf/laptop-mode-tools)
- [TLP conflict with tuned - English / Install/Boot/Login - openSUSE Forums](https://forums.opensuse.org/t/tlp-conflict-with-tuned/175203)
- [Update impossible because tlp conflict - English / Applications - openSUSE Forums](https://forums.opensuse.org/t/update-impossible-because-tlp-conflict/175252)

## TLP

Enable TLP service via `systemctl enable tlp.service`.

*References*:

- [TLP - ArchWiki](https://wiki.archlinux.org/title/TLP)

### Recalibrate the battery

Recalibrate the battery via `tlp recalibrate`. `sudo` may be required.

*References*:

- [*tlp recalibrate* terminates with an error message](https://linrunner.de/tlp/faq/battery.html#tlp-recalibrate-terminates-with-an-error-message)
