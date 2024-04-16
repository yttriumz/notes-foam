---
sitemap:
  lastmod: 2024-04-16 +0000
---

# Kernel Modules

Last modified: 2024-04-16 +0000

- [Load kernel modules](#load-kernel-modules)
- [Check kernel modules](#check-kernel-modules)

## Load kernel modules

From ChatGPT (Poe):

> The `sudo modprobe` command in Linux is used to load kernel modules into the running kernel. Kernel modules are pieces of code that can be dynamically loaded and unloaded to extend the functionality of the Linux kernel without the need to reboot the system.
>
> Here's a breakdown of the command syntax:
>
> - `sudo`: It stands for "superuser do" and allows a user with the necessary permissions to execute a command as the superuser or another user. The `sudo` command is often required for administrative tasks as it provides elevated privileges.
>
> - `modprobe`: This is the command used to manage kernel modules. It can load modules into the kernel, unload them, or perform other related operations.
>
> - `SOME_MOD`: Refers to the name of the module you want to load. You should replace `SOME_MOD` with the actual name of the module you intend to use.
>
> By using `sudo modprobe SOME_MOD`, you are instructing the system to load the specified module into the kernel. This is typically done when you need to enable a particular device driver or add support for a specific hardware component or feature that is provided by a kernel module.

## Check kernel modules

From ChatGPT (Poe):

> To check if a kernel module is loaded in Linux, you can use the `lsmod` command. Here's how you can do it:
>
> Open a terminal and run the following command:
>
> ```bash
> lsmod | grep <module_name>
> ```
>
> Replace `<module_name>` with the actual name of the module you want to check. This command will display the information about the loaded modules and filter the output to show only the line that matches the module name you specified.
>
> If the module is loaded, you will see a line of output containing the module name, along with information such as the module size, dependencies, and the number of modules using it.
>
> If the module is not loaded, there will be no output or an empty result.
>
> Alternatively, you can also use the `modinfo` command followed by the module name to display detailed information about a specific module. If the module is loaded, it will provide information about the module. If it's not loaded, you'll likely see an error indicating that the module was not found.
>
> ```bash
> modinfo <module_name>
> ```
>
> Remember to replace `<module_name>` with the actual name of the module you want to check.

*References*:

- [Location of Linux Kernel Module - Stack Overflow](https://stackoverflow.com/questions/4654990/location-of-linux-kernel-module)
