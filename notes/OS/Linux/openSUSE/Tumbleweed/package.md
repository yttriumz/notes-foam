# Package Management

## Repository

Refer to [the wiki]( https://en.opensuse.org/Package_repositories ) for more.

### Add repo

#### Packman and NVidia

Open *YaST Software Repositories* and select *Add* >> *Community Repositories*.

Note that after this, *YaST Software* may automatically select some NVidia drivers to install. Do **not** install them because they will cause problems. See [Graphics section](#graphics).

#### VSCode

Add *VSCode* repo (and install VSCode) by the following commands:

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode VSCode
sudo zypper refresh
sudo zypper install code
```

Refer to [the wiki]( https://en.opensuse.org/Visual_Studio_Code#Install ) for more.

#### CUDA

Add *CUDA* repo by the following commands:

```bash
zypper addrepo -p 100 http://developer.download.nvidia.com/compute/cuda/repos/opensuse15/x86_64/cuda-opensuse15.repo
```

Refer to [the post]( https://www.reddit.com/r/openSUSE/comments/gaihe9/cuda_on_tumbleweed/ ) for more.

#### M17N (Multilingualization)

Add *M17N* repo by the following commands:

```bash
zypper addrepo https://download.opensuse.org/repositories/M17N/openSUSE_Tumbleweed/M17N.repo
```

#### Flatpaks

Add *Flatpaks* by the following commands:

```bash
sudo zypper in flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Refer to [the community guide]( https://opensuse.github.io/openSUSE-docs-revamped-temp/best_of_post/#setup-your-tumbleweed-for-flatpaks ) for more.

#### Chrome

Refer to [the post]( https://linuxhint.com/installing-google-chrome-opensuse/ ).

### Check repo

Use *YaST* or `zypper repos -P`.

### Set priority

Use *YaST* or `zypper modifyrepo -p`.

## Package Query

### Unused Packages

Use `zypper packages --unneeded`.

Refer to [the post]( https://www.reddit.com/r/openSUSE/comments/9gtcga/how_to_remove_unneeded_dependencies_after_zypper/ ).

### Installation History

The history can be found in `/var/log/zypp/history`. Root permission might be needed.
