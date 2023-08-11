# Power Management

*References*:

- [Power management](https://wiki.archlinux.org/title/Power_management)
- [Laptop Mode Tools](https://wiki.archlinux.org/title/Laptop_Mode_Tools)
- [CPU frequency scaling](https://wiki.archlinux.org/title/CPU_frequency_scaling)
- [auto-cpufreq](https://github.com/AdnanHodzic/auto-cpufreq)
- [Laptop Mode Tools README](https://github.com/rickysarraf/laptop-mode-tools)

## TLP

Enable TLP service via `systemctl enable tlp.service`.

*References*:

- [TLP](https://wiki.archlinux.org/title/TLP)

### Recalibrate the battery

Recalibrate the battery via `tlp recalibrate`. `sudo` may be required.

*References*:

- [*tlp recalibrate* terminates with an error message](https://linrunner.de/tlp/faq/battery.html#tlp-recalibrate-terminates-with-an-error-message)
