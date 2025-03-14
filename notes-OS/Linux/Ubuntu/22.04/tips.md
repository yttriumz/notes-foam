---
sitemap:
  lastmod: 2025-03-13 +0000
---

# Tips

Last modified: 2025-03-13 +0000

- [Interesting posts](#interesting-posts)
- [Partitioning and LVM](#partitioning-and-lvm)
- [Change IP](#change-ip)
- [cloud-init](#cloud-init)
- [Network interface with a static IP address](#network-interface-with-a-static-ip-address)

## Interesting posts

- [debian - How can I enable verbose output in apt? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/570680/how-can-i-enable-verbose-output-in-apt)

## Partitioning and LVM

See [[file-system#Logical Volume Manager]].

## Change IP

Normally just do:

```bash
sudo vim /etc/netplan/00-installer-config.yaml
netplan apply
```

On Ubuntu server, there is a component `cloud-init` that configs the network. Can simply disable it.

## cloud-init

*References*:

- [Why do I need cloud-init? : r/homelab](https://www.reddit.com/r/homelab/comments/lqr51r/why_do_i_need_cloudinit/)
- [I'm using Ubuntu Server for a simple home server - do I need cloud-init? - Ask Ubuntu](https://askubuntu.com/questions/1060062/im-using-ubuntu-server-for-a-simple-home-server-do-i-need-cloud-init)
- [cloud-init/doc/examples at ubuntu/24.1.3-0ubuntu1_20.04.5 · canonical/cloud-init](https://github.com/canonical/cloud-init/tree/ubuntu/24.1.3-0ubuntu1_20.04.5/doc/examples)
- [CloudInit - Community Help Wiki](https://help.ubuntu.com/community/CloudInit)
- [How to disable cloud-init - cloud-init 24.4 documentation](https://cloudinit.readthedocs.io/en/latest/howto/disable_cloud_init.html)
- [How to use cloud-init](https://documentation.ubuntu.com/lxd/en/latest/cloud-init/)
- [How to disable cloud-init in Ubuntu](https://gist.github.com/zoilomora/f862f76335f5f53644a1b8e55fe98320)
- [networking - How to setup a static IP on Ubuntu Server 18.04 - Ask Ubuntu](https://askubuntu.com/questions/1029531/how-to-setup-a-static-ip-on-ubuntu-server-18-04)

## Network interface with a static IP address

```yaml
- name: Ensure there are at least one interface using static IP addresses
    shell: |
    grep -q '^BOOTPROTO\s*=\s*"*\(static\|none\)"*' /etc/sysconfig/network-scripts/ifcfg-*
```

<details>

From Phind:

> This Ansible snippet is designed to check if there is at least one network interface on a CentOS 7 server that is configured to use a static IP address or none. It does this by searching through the network configuration files located in `/etc/sysconfig/network-scripts/`. Here's a breakdown of what each part of the snippet does:
>
> 1. **Task Name**: The task is named "Ensure there are at least one interface using static IP addresses". This gives a clear indication of the purpose of the task.
>
> 2. **Shell Command**: The task uses a `shell` module to execute a shell command. The command is a `grep` command that searches for lines in the network configuration files that match a specific pattern. The pattern is designed to match lines where the `BOOTPROTO` setting is set to either `static` or `none`. This is important because `BOOTPROTO=static` means the interface is configured with a static IP address, while `BOOTPROTO=none` means the interface is not configured to obtain an IP address automatically.
>
> 3. **Search Pattern**: The search pattern `'^BOOTPROTO\s*=\s*"*\(static\|none\)"*'` is used to match lines in the configuration files. Here's a breakdown of the pattern:
>    - `^BOOTPROTO`: Matches lines that start with `BOOTPROTO`.
>    - `\s*=\s*`: Matches an equals sign (`=`) with any amount of whitespace (`\s*`) before and after it.
>    - `"*\(static\|none\)"*`: Matches either `static` or `none` enclosed in double quotes, with any amount of whitespace and optional quotes around them.
>
> 4. **Configuration Files**: The command searches through all files in `/etc/sysconfig/network-scripts/` that match the pattern `ifcfg-*`. This is a common naming convention for network interface configuration files on CentOS 7 and similar systems.
>
> 5. **Purpose**: The purpose of this task is to ensure that at least one network interface on the server is configured with a static IP address or is not configured to obtain an IP address automatically. This is important for servers that need to have a predictable network configuration, such as Kubernetes nodes or other services that rely on stable network interfaces.
>
> In summary, this Ansible snippet checks the network configuration on a CentOS 7 server to ensure that at least one network interface is configured with a static IP address or is not configured to obtain an IP address automatically.

From Phind:

> On Ubuntu 22.04, the network configuration files are located in `/etc/netplan/` instead of `/etc/sysconfig/network-scripts/`. The configuration files are typically named with a `.yaml` extension and are used by Netplan, which is the default network management tool on Ubuntu 22.04.
>
> To achieve the same goal as the original Ansible snippet on Ubuntu 22.04, you would need to modify the task to search through the Netplan configuration files for interfaces configured with a static IP address or none. Here's how you could adjust the task:
>
> ```yaml
> - name: Ensure there are at least one interface using static IP addresses
>   shell: |
>      grep -q '^    addresses:' /etc/netplan/*.yaml
>   register: netplan_output
>   changed_when: netplan_output.rc != 0
> ```
>
> This task uses `grep` to search for lines starting with `addresses:` in all `.yaml` files within `/etc/netplan/`. The `addresses:` line in a Netplan configuration file indicates that the interface is configured with a static IP address. The `grep -q` option is used to suppress output and only return the exit status, which is captured by the `register` keyword. The `changed_when` condition is set to trigger a change when the `grep` command fails (i.e., when it does not find any lines matching the pattern), which would indicate that no interfaces are configured with static IP addresses.
>
> However, this approach is quite simplistic and might not cover all cases, especially if your network configuration is more complex. A more robust approach would involve parsing the YAML files to check for specific configurations, which could be done using a tool like `yq` or a custom script that can handle YAML parsing.
>
> Here's an example using `yq` to check if any interface is configured with a static IP address:
>
> ```yaml
> - name: Ensure there are at least one interface using static IP addresses
>   shell: |
>      yq e '.network.ethernets.*.addresses | length > 0' /etc/netplan/*.yaml
>   register: netplan_output
>   changed_when: netplan_output.rc != 0
> ```
>
> This command uses `yq` to evaluate the YAML files and checks if any interface under `.network.ethernets` has an `addresses` field with a length greater than 0, indicating a static IP address configuration. Note that you would need to have `yq` installed on your system for this to work.
>
> Remember, the exact command might need to be adjusted based on your specific network configuration and the structure of your Netplan files.

From Phind:

> On Ubuntu systems using Netplan for network configuration, the configuration files are written in YAML format and are located in the `/etc/netplan/` directory. The structure and content of these files can vary depending on the specific network setup, but I'll provide examples for the two scenarios you've mentioned:
>
> ### 1. No Network Interface Configured with a Static IP Address
>
> If no network interface is configured with a static IP address, the configuration file might not explicitly specify an IP address for any interface. Instead, it might rely on DHCP (Dynamic Host Configuration Protocol) to automatically obtain an IP address. Here's an example of what such a configuration might look like:
>
> ```yaml
> network:
>  version: 2
>  renderer: networkd
>  ethernets:
>     eth0:
>       dhcp4: yes
> ```
>
> In this example:
>
> - `version: 2` specifies the version of the Netplan configuration syntax.
> - `renderer: networkd` indicates that the `networkd` backend is used for managing the network configuration.
> - `ethernets:` defines the configuration for Ethernet interfaces.
> - `eth0:` is the name of the Ethernet interface.
> - `dhcp4: yes` indicates that the interface should use DHCP to obtain an IPv4 address automatically.
>
> ### 2. The Interface is Configured to Obtain an IP Address Automatically
>
> If an interface is explicitly configured to obtain an IP address automatically, the configuration file would specify this directly. Here's an example:
>
> ```yaml
> network:
>  version: 2
>  renderer: networkd
>  ethernets:
>     eth0:
>       dhcp4: true
> ```
>
> In this example, the configuration is similar to the previous one, but it explicitly sets `dhcp4: true` to indicate that the interface should use DHCP to obtain an IPv4 address automatically.
>
> ### Note on Static IP Configuration
>
> If you wanted to configure a network interface with a static IP address, you would specify the `addresses` and `gateway4` (for IPv4) or `gateway6` (for IPv6) fields under the interface configuration. Here's an example of a static IP configuration:
>
> ```yaml
> network:
>  version: 2
>  renderer: networkd
>  ethernets:
>     eth0:
>       addresses:
>         - 192.168.1.10/24
>       gateway4: 192.168.1.1
>       nameservers:
>           addresses: [8.8.8.8, 8.8.4.4]
> ```
>
> In this example:
>
> - `addresses:` specifies the static IP address and subnet mask for the interface.
> - `gateway4:` specifies the default gateway for IPv4 traffic.
> - `nameservers:` specifies the DNS servers to use.
>
> These examples should give you a good starting point for understanding how network configurations are specified in Netplan on Ubuntu systems.

What if I have a config like the following?

```yaml
# This is the network config written by 'subiquity'
network:
  ethernets:
    ens160:
      addresses:
      - 192.168.75.232/24
      nameservers:
        addresses:
        - 192.168.100.1
        - 1.1.1.1
        search:
        - ewalker.com.hk
      routes:
      - to: default
        via: 192.168.75.254
  version: 2
```

From Phind:

> The configuration you've provided is a Netplan configuration file for an Ubuntu system. It specifies the network settings for an Ethernet interface named `ens160`. Here's a breakdown of what each part of the configuration does:
>
> - **`network:`** This is the root of the network configuration. It contains all the network settings for the system.
>
> - **`ethernets:`** This section defines the configuration for Ethernet interfaces. In this case, there's a single interface named `ens160`.
>
> - **`ens160:`** This is the name of the Ethernet interface. The configuration settings for this interface follow.
>
> - **`addresses:`** This specifies the static IP address and subnet mask for the `ens160` interface. The interface is configured with the IP address `192.168.75.232` and a subnet mask of `/24`, which corresponds to `255.255.255.0`.
>
> - **`nameservers:`** This section specifies the DNS servers to use. The interface is configured to use `192.168.100.1` and `1.1.1.1` as DNS servers. Additionally, it specifies a search domain of `ewalker.com.hk`.
>
> - **`routes:`** This section defines custom routes for the interface. In this case, there's a single route defined:
>   - **`to: default`** This indicates that the route is for the default gateway.
>   - **`via: 192.168.75.254`** This specifies the next hop for the default route, which is `192.168.75.254`.
>
> - **`version: 2`** This specifies the version of the Netplan configuration syntax. Version 2 is the latest version as of Ubuntu 20.04 and later.
>
> This configuration indicates that the `ens160` interface is configured with a static IP address (`192.168.75.232/24`), DNS servers (`192.168.100.1` and `1.1.1.1`), a search domain (`ewalker.com.hk`), and a default route (`192.168.75.254`). The interface is not configured to use DHCP to obtain an IP address automatically, as there's no `dhcp4: yes` or `dhcp4: true` setting.

</details>

[//begin]: # "Autogenerated link references for markdown compatibility"
[file-system#Logical Volume Manager]: ../../file-system.md "Storage & File System"
[//end]: # "Autogenerated link references"
