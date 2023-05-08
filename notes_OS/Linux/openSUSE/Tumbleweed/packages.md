# Package Management

- [Package Management](#package-management)
    - [Repository management](#repository-management)
        - [Add repo](#add-repo)
            - [Packman and NVidia](#packman-and-nvidia)
            - [VSCode](#vscode)
            - [containers](#containers)
            - [NVIDIA Container Toolkit](#nvidia-container-toolkit)
            - [CUDA](#cuda)
            - [M17N (Multilingualization)](#m17n-multilingualization)
            - [Google Chrome](#google-chrome)
            - [Microsoft Edge](#microsoft-edge)
            - [Brave Browser](#brave-browser)
            - [Some repo reference](#some-repo-reference)
        - [Check repo](#check-repo)
        - [Set priority](#set-priority)
    - [Package Query](#package-query)
        - [Unused Packages](#unused-packages)
        - [Installation History](#installation-history)
        - [Package Dependency](#package-dependency)
    - [Lock](#lock)
        - [Lock packages](#lock-packages)
        - [Lock patterns](#lock-patterns)
        - [List locks](#list-locks)
    - [Flatpak](#flatpak)
        - [Interesting posts](#interesting-posts)
    - [Install rpm](#install-rpm)
        - [Zoom](#zoom)
    - [Become a Packager](#become-a-packager)

## Repository management

Refer to [the wiki]( https://en.opensuse.org/Package_repositories ) for more.

### Add repo

#### Packman and NVidia

Open *YaST Software Repositories* and select *Add* >> *Community Repositories*.

Note that after this, *YaST Software* may automatically select some NVidia drivers to install. Do **not** install them because they will cause problems. See [[Tumbleweed/tweak#NVIDIA graphics card]].

#### VSCode

Add *VSCode* repo (and install *VSCode*) by the following commands:

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode VSCode
sudo zypper refresh
sudo zypper install code
```

References:

- [Wiki](https://en.opensuse.org/Visual_Studio_Code#Install)

#### containers

Add *Virtualization:containers* repo by the following commands:

```bash
sudo zypper addrepo https://download.opensuse.org/repositories/Virtualization:containers/openSUSE_Tumbleweed/Virtualization:containers.repo
```

References:

- https://software.opensuse.org/download.html?project=Virtualization%3Acontainers&package=docker#manualopenSUSE

#### NVIDIA Container Toolkit

1. Add *NVIDIA Container Toolkit* repo by the following commands:

    ```bash
    sudo zypper addrepo https://nvidia.github.io/libnvidia-container/opensuse-leap15.1/libnvidia-container.repo
    # The following one is the same
    sudo zypper addrepo https://nvidia.github.io/libnvidia-container/sles15.1/libnvidia-container.repo
    ```

2. Install *NVIDIA Container Toolkit* by the following commands:

    ```bash
    sudo zypper install nvidia-container-toolkit
    ```

3. Config *docker* by the following commands:

   ```bash
   sudo nvidia-ctk runtime configure --runtime=docker
   ```

4. Verify installation by the following commands:

   ```bash
   docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
   ```

References:

- https://github.com/NVIDIA/nvidia-docker
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html
- [package info details](https://github.com/NVIDIA/nvidia-docker/issues/1268#issuecomment-632692949)
- [How to use with Docker 19.03 / nvidia-container-toolkit?](https://github.com/NVIDIA/k8s-device-plugin/issues/168#issuecomment-625981223)

#### CUDA

Add *CUDA* repo by the following commands:

```bash
sudo ypper addrepo -p 100 https://developer.download.nvidia.com/compute/cuda/repos/opensuse15/x86_64/cuda-opensuse15.repo
```

References:

- https://www.reddit.com/r/openSUSE/comments/gaihe9/cuda_on_tumbleweed/

#### M17N (Multilingualization)

Add *M17N* repo by the following commands:

```bash
sudo zypper addrepo https://download.opensuse.org/repositories/M17N/openSUSE_Tumbleweed/M17N.repo
```

#### Google Chrome

Use the following commands:

```bash
sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub
sudo zypper addrepo https://dl.google.com/linux/chrome/rpm/stable/x86_64 "Google Chrome"
sudo zypper refresh
sudo zypper install google-chrome-stable
```

References:

- https://www.google.com/linuxrepositories/
- https://linuxhint.com/installing-google-chrome-opensuse/

#### Microsoft Edge

Add *Microsoft Edge* repo (and install *Microsoft Edge*) by the following commands:

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper addrepo https://packages.microsoft.com/yumrepos/edge "Microsoft Edge"
sudo zypper refresh
sudo zypper install microsoft-edge-stable
```

#### Brave Browser

Add *Brave* repo (and install *Brave*) by the following commands:

```bash
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo zypper refresh
sudo zypper install brave-browser
```

References:

- [Installing Brave on Linux](https://brave.com/linux/)

#### Some repo reference

![repos](attachments/Screenshot%202023-02-13%20151118.png)

### Check repo

Use *YaST* or `zypper repos -P`.

### Set priority

Use *YaST* or `zypper modifyrepo -p`.

## Package Query

### Unused Packages

1. Use `zypper packages --unneeded` to check.

2. Use `zypper packages --unneeded | grep ^i | cut -d '|' -f3 | xargs sudo zypper rm --clean-deps --no-confirm` to uninstall.

References:

- https://forums.opensuse.org/t/cleanup-of-distribution-upgrades/152148

### Installation History

The history can be found in `/var/log/zypp/history`. Root permission might be needed.

### Package Dependency

- Use `zypper info --requires SOME_PACKAGE` to check `SOME_PACKAGE`'s dependency.
- Use `zypper search --requires SOME_PACKAGE` to obtain packages that needs `SOME_PACKAGE`.

## Lock

### Lock packages

- *YaST* can be used.

### Lock patterns

- [ ] todo

### List locks

Use `zypper locks`.

## Flatpak

Install *Flatpak* by the following commands:

```bash
sudo zypper in flatpak

```

Add *flathub* repo by the following commands:

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Refer to [the community guide]( https://opensuse.github.io/openSUSE-docs-revamped-temp/best_of_post/#setup-your-tumbleweed-for-flatpaks ) for more.

### Interesting posts

- [Flatpak Is Not the Future](https://ludocode.com/blog/flatpak-is-not-the-future)
- [Flatpak Is Not the Future | Hacker News](https://news.ycombinator.com/item?id=29316024)

## Install rpm

Use `zypper install /path/to/manually/downloaded.rpm`.

References:

- https://opensuse-guide.org/installpackage.php
- https://forums.opensuse.org/t/how-to-install-rpm-files/24479

### Zoom

Download from [the official site](https://zoom.us/download?os=linux). `ibus` could be locked before installing.

References:

- https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux
- https://www.reddit.com/r/openSUSE/comments/p4yhg0/does_anyone_here_know_of_a_good_guide_for/

## Become a Packager

References:

- [Guide: How To Become A Packager](https://www.reddit.com/r/openSUSE/comments/10rpb24/guide_how_to_become_a_packager/)

[//begin]: # "Autogenerated link references for markdown compatibility"
[Tumbleweed/tweak#NVIDIA graphics card]: tweak.md "Tweak openSUSE Tumbleweed on ThinkPad P1 Gen2"
[//end]: # "Autogenerated link references"
