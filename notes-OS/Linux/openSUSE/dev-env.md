---
sitemap:
  lastmod: 2024-11-04 +0000
  priority: 1.0
---

# openSUSE Development Environment

Last modified: 2024-11-04 +0000

**NOTE**: This note assumes Tumbleweed by default, but most content should also apply to Leap. Some of the existing differences between Tumbleweed and Leap are mentioned in the corresponding instructions.

- [git](#git)
- [Basic environment](#basic-environment)
- [Android](#android)
   - [Android Studio](#android-studio)
- [C\_Cpp](#c_cpp)
- [Clojure](#clojure)
- [Flutter](#flutter)
- [Garmin Connect IQ](#garmin-connect-iq)
- [Go](#go)
- [Haskell](#haskell)
- [Java](#java)
- [Node.js](#nodejs)
   - [fnm](#fnm)
- [Perl](#perl)
- [PowerShell 7](#powershell-7)
- [Python](#python)
   - [pyenv](#pyenv)
      - [Install Python releases](#install-python-releases)
- [Rust](#rust)
- [Scala](#scala)
- [Docker](#docker)
   - [Build and run NVidia GPU accelerated Docker containers](#build-and-run-nvidia-gpu-accelerated-docker-containers)
- [Kubernetes](#kubernetes)
- [KVM](#kvm)
- [bochs](#bochs)
- [Machine Learning](#machine-learning)
   - [TensorFlow 2](#tensorflow-2)

## git

It is included in the `devel_basis` pattern. See [Basic environment](#basic-environment).

See [[git]] for configuration.

## Basic environment

Install the `devel_basis` pattern via the following commands:

```bash
zypper install --type pattern devel_basis
zypper install pattern:devel_basis # Does the same
```

## Android

### Android Studio

1. Download the package from [the official site](https://developer.android.com/studio).
2. Extract and move the package to `/opt` via the following commands:

   ```bash
   sudo tar -zxvf DOWNLOADED_PACKAGE --directory=/opt
   ```

3. Add the following to `~/.bash_profile`:

   ```bash
   # Android environment
   export ANDROID_HOME="$HOME/Android/Sdk"
   export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"
   ```

4. Run `/opt/android-studio/bin/studio.sh`.
5. Install `cmdline-tools` from the studio. Go to *File > Settings > Appearance & Behavior > System Settings > Android SDK > SDK Tools*.
6. (Optional) Install NDK [for building Rust code for Android](https://cjycode.com/flutter_rust_bridge/tutorial/setup_android.html#android-ndk). Go to *SDK Manager > SDK Tools > NDK (side by side)*.
7. On the welcome page, press `ctrl`+`shift`+`a` and search "device". Create AVD using *Virtual Device Manager*.

*References*:

- [Install Android Studio](https://developer.android.com/studio/install#linux)
- [7. Linux: Download and install Android Studio](https://developer.android.com/codelabs/basic-android-kotlin-compose-install-android-studio#6)
- [How to Install Android Studio on openSUSE 15 Easy Guide](https://tutorialforlinux.com/2019/05/08/how-to-install-android-studio-on-opensuse-15-gnulinux-easy-guide/2/)
- [Command-line tools](https://developer.android.com/studio/command-line)
- [Variables reference](https://developer.android.com/studio/command-line/variables#envar)
- [Configure VM acceleration on Linux](https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux)

## C_Cpp

- [ ] todo

## Clojure

1. Install Java. See [[#Java]].
2. Install dependencies via `zypper install rlwrap`.
3. Install Clojure into `$HOME/.clojure`:

   ```bash
   curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
   chmod +x linux-install.sh
   ./linux-install.sh --prefix ~/.clojure
   ```

4. Add the following to `$HOME/.profile`:

   ```bash
   export PATH=$PATH:/home/az/.clojure/bin
   ```

*References*:

- [Clojure - Install Clojure](https://clojure.org/guides/install_clojure)
- [Get Started with Clojure - Calva User Guide](https://calva.io/get-started-with-clojure/)

## Flutter

1. Install dependencies via the following commands:

   ```bash
   zypper install \
       clang17-devel \
       ninja \
       gtk3-devel
   ```

2. Refer to [the official docs](https://docs.flutter.dev/get-started/install/linux). I installed it under `$HOME/.flutter`.
3. Add the following to `~/.bash_profile`:

   ```bash
   # Flutter environment
   export PATH="$PATH:$HOME/.flutter/bin"
   ```

4. Use `flutter doctor` to validate the installation.

## Garmin Connect IQ

1. Install the following dependencies:

   ```text
   libwebkit2gtk-4_0-37
   ```

   ```text
   The following 2 recommended packages were automatically selected:
     gstreamer-plugins-bad  1.24.0-4.1  x86_64  openSUSE-Tumbleweed-Oss  openSUSE
     openal-soft-data       1.22.2-1.8  noarch  openSUSE-Tumbleweed-Oss  openSUSE

   The following 48 NEW packages are going to be installed:
     gstreamer-libnice                0.1.21-3.6            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     gstreamer-plugin-openh264        1.22.2-1.suse1699.1   x86_64  Open H.264 Codec (openSUSE Tumbleweed)  obs://build.opensuse.org/openSUSE:Factory
     gstreamer-plugins-bad            1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libavtp0                         0.2.0-2.3             x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgssdp-1_6-0                   1.6.3-1.3             x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstadaptivedemux-1_0-0        1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstanalytics-1_0-0            1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstbadaudio-1_0-0             1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstbasecamerabinsrc-1_0-0     1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstcodecparsers-1_0-0         1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstcodecs-1_0-0               1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstcuda-1_0-0                 1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstinsertbin-1_0-0            1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstisoff-1_0-0                1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstmpegts-1_0-0               1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstmse-1_0-0                  1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstsctp-1_0-0                 1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgsttranscoder-1_0-0           1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgsturidownloader-1_0-0        1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstva-1_0-0                   1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstvulkan-1_0-0               1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstwayland-1_0-0              1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstwebrtc-1_0-0               1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgstwebrtcnice-1_0-0           1.24.0-4.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgupnp-1_6-0                   1.6.6-3.1             x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libgupnp-igd-1_6-0               1.6.0-2.5             x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libharfbuzz-icu0                 8.5.0-1.1             x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libhyphen0                       2.8.8-2.31            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libjavascriptcoregtk-4_0-18      2.44.2-1.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     liblrdf2                         0.6.1-1.15            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libmanette-0_2-0                 0.2.7-1.1             x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libmicrodns1                     0.2.0+6-2.4           x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libmpcdec6                       r475-6.2              x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libnice10                        0.1.21-3.6            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libopenal1                       1.22.2-1.8            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libportaudio2                    190700_20210406-1.11  x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libraptor2-0                     2.0.16-3.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libSoundTouch1                   2.3.3-1.1             x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libsoup-2_4-1                    2.74.3-3.3            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libspandsp3                      3.0.0+g21-1.3         x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libsrtp2-1                       2.6.0-1.1             x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libwebkit2gtk-4_0-37             2.44.2-1.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libwoff2common1_0_2              1.0.2-4.6             x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libwoff2dec1_0_2                 1.0.2-4.6             x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     libzbar0                         0.23.93-2.3           x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     mpg123-openal                    1.32.6-1.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
     openal-soft-data                 1.22.2-1.8            noarch  openSUSE-Tumbleweed-Oss                 openSUSE
     webkit2gtk-4_0-injected-bundles  2.44.2-1.1            x86_64  openSUSE-Tumbleweed-Oss                 openSUSE
   ```

2. Download the SDK Manager from [the official site](https://developer.garmin.com/connect-iq/sdk/).
3. Follow the instructions, and the SDK will be downloaded under `$HOME/.Garmin`.

## Go

1. Refer to [the official docs](https://go.dev/doc/install). I installed it under `$HOME/.go`.
2. Add the following to `~/.bash_profile`:

   ```bash
   # Go environment
   export PATH="$PATH:$HOME/.go/bin"
   ```

*References*:

- [The `GOPATH` environment variable](https://go.dev/doc/gopath_code#GOPATH)

## Haskell

Install the Haskell toolkit via the following commands:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

*References*:

- [GHCup](https://www.haskell.org/ghcup/)

## Java

- Use a version manager: See [[Java#Java version manager]].
- Install a system-wide specific version via the following commands:

  ```bash
  zypper install java-17-openjdk-devel java-17-openjdk-src
  ```

*References*:

- [SDB:Installing Java](https://en.opensuse.org/SDB:Installing_Java)
- [How to install Java Development Kit (JDK) on openSUSE and SLES](https://www.simplified.guide/java/jdk-install-suse)

## Node.js

It is recommended to use a Node version manager to install Node.js and npm.

*References*:

- [Download and install node and npm](https://docs.npmjs.com/cli/v9/configuring-npm/install)

### fnm

- Install via `curl -fsSL https://fnm.vercel.app/install | bash`.
- Upgrade via `curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell`.

*References*:

- [Fast Node Manager (fnm)](https://github.com/Schniz/fnm)

## Perl

1. Install [Perlbrew](https://github.com/gugod/App-perlbrew/) via `zypper install perl-App-perlbrew`.

   9 packages will be installed: `perl-App-perlbrew perl-Capture-Tiny perl-CPAN-Perl-Releases perl-Devel-PatchPerl perl-File-pushd perl-local-lib perl-Module-Build perl-Module-Pluggable perl-Module-Runtime`.
2. Run `perlbrew init` to prepare it.
3. Add the following to `$HOME/.bashrc`:

   ```bash
   source ~/perl5/perlbrew/etc/bashrc
   ```

## PowerShell 7

Go to [the official repository](https://github.com/PowerShell/PowerShell/releases) and install an LTS version (e.g. `powershell-lts-7.2.13-1.rh.x86_64.rpm`) via the following command:

```bash
zypper install https://github.com/PowerShell/PowerShell/releases/download/v7.2.13/powershell-lts-7.2.13-1.rh.x86_64.rpm
```

At the time of writing (*Tumbleweed 20230707, PowerShell 7.2.13*), I encountered the following issue and ignored it:

```text
Problem: nothing provides 'openssl-libs' needed by the to be installed powershell-lts-7.2.13-1.rh.x86_64
 Solution 1: do not install powershell-lts-7.2.13-1.rh.x86_64
 Solution 2: break powershell-lts-7.2.13-1.rh.x86_64 by ignoring some of its dependencies
```

*References*:

- [PowerShell](https://en.opensuse.org/PowerShell)
- [Install PowerShell on Linux](https://learn.microsoft.com/en-US/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.2)
- [PowerShell paths](https://learn.microsoft.com/en-us/powershell/scripting/install/install-rhel?view=powershell-7.2#powershell-paths)
- [Install the .NET SDK or the .NET Runtime on openSUSE](https://learn.microsoft.com/en-us/dotnet/core/install/linux-opensuse)
- [Using Visual Studio Code for PowerShell Development](https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/vscode/using-vscode?view=powershell-7.2)

## Python

- `python3` is already available upon system installation.
- Use a version manager.

### pyenv

1. Install pyenv via one the following methods.

   - Install via `zypper`:

     ```bash
     zypper install pyenv
     ```

   - Directly pull the repository:

     ```bash
     git clone https://github.com/pyenv/pyenv.git ~/.pyenv
     ```

2. Add the following to `~/.bashrc`:

   ```bash
   # pyenv
   # command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
   # eval "$(pyenv init --path)"
   export PYENV_ROOT="$HOME/.pyenv"
   [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
   eval "$(pyenv init -)"
   ```

3. Verify installation by inspecting the output:

   ```bash
   echo $PATH | grep --color=auto "$(pyenv root)/shims"
   ```

*References*:

- [How to verify that I have set up pyenv correctly?](https://github.com/pyenv/pyenv/wiki#how-to-verify-that-i-have-set-up-pyenv-correctly)

#### Install Python releases

- Python 3.6.8:

  1. Install the following dependencies:

     ```text
     sqlite3-devel xz-devel
     ```

  2. Install Python via `CC=clang pyenv install 3.6.8`.

*References*:

- [Suggested build environment](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)
- [Command `pyenv install 3.6.8` fails on Arch (segmentation fault and 'error: failed to install pip via get-pip.py') · Issue #2141 · pyenv/pyenv](https://github.com/pyenv/pyenv/issues/2141)

## Rust

I installed it under `$HOME/.rust` by adding the following to `.bash_profile` before installation:

```bash
# Rust environment
export RUSTUP_HOME=$HOME/.rust/.rustup
export CARGO_HOME=$HOME/.rust/.cargo
```

*References*:

- [Installation](https://doc.rust-lang.org/book/ch01-01-installation.html)

## Scala

1. (Optional) [Java](#java) can be installed before Scala.
2. I installed it under `$HOME/.coursier` by adding the following to `.bash_profile` before installation:

   ```bash
   # Scala environment
   export COURSIER_BIN_DIR=$HOME/.coursier/bin
   ```

*References*:

- [Installation · Coursier](https://get-coursier.io/docs/cli-installation)
- [install · Coursier](https://get-coursier.io/docs/cli-install#installation-directory)

## Docker

1. Add *Virtualization:containers* repository. See [[openSUSE/package#Container]].
2. Install docker and docker-compose using the following commands:

   ```bash
   zypper install docker docker-compose
   ```

3. Verify installation via the following commands:

   ```bash
   sudo docker run --rm hello-world
   ```

See [[Docker]] for usage.

### Build and run NVidia GPU accelerated Docker containers

See [[openSUSE/package#NVIDIA Container Toolkit]].

## Kubernetes

See [[openSUSE/package#Kubernetes]].

## KVM

For KVM usage, see [[KVM]].

1. At the time of writing (*Tumbleweed 20230707*), install KVM-related tools via the following commands:

   ```bash
   zypper install --type pattern kvm_tools
   zypper install libvirt
   ```

2. Verify via the following commands:

   ```bash
   virt-host-validate
   ```

   The following may be added to boot parameter depending on the output and use case:

   ```text
   cgroup_enable=cpu cgroup_enable=cpuset cgroup_enable=devices cgroup_enable=freezer cgroup_enable=blkio
   ```

*References*:

- [6.2.3 Installing specific installation patterns](https://doc.opensuse.org/documentation/leap/virtualization/single-html/book-virtualization/#install-virtualization-components-pattern)
- [32 Setting up a KVM VM Host Server](https://doc.opensuse.org/documentation/leap/virtualization/single-html/book-virtualization/#cha-qemu-host)
- [How To Use Virtual Machines on Linux](https://www.youtube.com/watch?v=t-23HOKMer0)
- [Setup Qemu in Debian Linux](https://christitus.com/vm-setup-in-linux/)
- [Freezer error when installing KVM on Debian.](https://www.reddit.com/r/linuxquestions/comments/w38k31/comment/iguuy6j/?utm_source=share&utm_medium=web2x&context=3)
- [Unified Virtual Machine Administration using libvirt](https://documentation.suse.com/smart/virtualization-cloud/html/manage-vm-on-commandline/index.html)

## bochs

1. Add *Emulators* repository. See [[openSUSE/package#Emulators]].
2. Install bochs via the following commands:

   ```bash
   zypper install bochs
   ```

See [[bochs]] for usage.

*References*:

- [Welcome to the Bochs IA-32 Emulator Project](https://bochs.sourceforge.io/)

## Machine Learning

### TensorFlow 2

It is recommended to run TensorFlow 2 in a container.

1. Install Docker. See [Docker](#docker).
2. Install NVIDIA Container Toolkit. See [[openSUSE/package#NVIDIA Container Toolkit]].
3. Install TensorFlow 2 via the following commands:

   ```bash
   sudo docker pull tensorflow/tensorflow:latest-gpu-jupyter
   ```

4. Verify installation via the following commands:

   ```bash
   docker run --runtime=nvidia --gpus all --rm tensorflow/tensorflow:latest-gpu-jupyter nvidia-smi
   ```

*References*:

- [Docker  \|  TensorFlow](https://www.tensorflow.org/install/docker)
- [Installing on SUSE 15](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-on-suse-15)
- [Document supported CUDA/cuDNN versions · Issue #57000 · tensorflow/tensorflow](https://github.com/tensorflow/tensorflow/issues/57000)
- [Upgrade TF to CUDA 11.4 and cuDNN 8.2 · Issue #51659 · tensorflow/tensorflow](https://github.com/tensorflow/tensorflow/issues/51659)

[//begin]: # "Autogenerated link references for markdown compatibility"
[git]: ../../../notes-development/git.md "Git Usage"
[#Java]: dev-env.md "openSUSE Development Environment"
[Java#Java version manager]: ../../../notes-development/Java.md "Java"
[openSUSE/package#Container]: package.md "openSUSE Package Management"
[Docker]: ../../containerization/Docker.md "Docker Operations"
[openSUSE/package#NVIDIA Container Toolkit]: package.md "openSUSE Package Management"
[openSUSE/package#Kubernetes]: package.md "openSUSE Package Management"
[KVM]: ../../virtualization/KVM.md "Kernel-based Virtual Machine"
[openSUSE/package#Emulators]: package.md "openSUSE Package Management"
[bochs]: ../../virtualization/bochs.md "bochs"
[//end]: # "Autogenerated link references"
