# OpenSUSE Tumbleweed Development Environment

- [SSH](#ssh)
- [git](#git)
- [VSCode](#vscode)
- [Docker](#docker)
   - [Build and run NVidia GPU accelerated Docker containers](#build-and-run-nvidia-gpu-accelerated-docker-containers)
- [KVM](#kvm)
- [Basic environment](#basic-environment)
- [Android](#android)
   - [Android Studio](#android-studio)
- [C\_Cpp](#c_cpp)
- [Flutter](#flutter)
- [Go](#go)
- [Java](#java)
- [JavaScript](#javascript)
   - [Node.js](#nodejs)
      - [fnm](#fnm)
- [PowerShell 7](#powershell-7)
- [Python](#python)
- [Rust](#rust)
- [Scala](#scala)
- [Machine Learning](#machine-learning)
   - [TensorFlow 2](#tensorflow-2)

## SSH

See [[SSH]] for configuration.

## git

See [[cross-platform/git]] for configuration.

## VSCode

See [[packages#VSCode]].

## Docker

For usage, see [[notes_development/Docker]].

1. Add *Virtualization:containers* repo. See [[packages#containers]].
2. Install docker using the following commands:

   ```bash
   zypper install docker
   ```

3. Verify installation by the following commands:

   ```bash
   sudo docker run --rm hello-world
   ```

### Build and run NVidia GPU accelerated Docker containers

See [[packages#NVIDIA Container Toolkit]]

## KVM

At the time of writing (*Tumbleweed 20230707*), install KVM-related tools via the following commands:

```bash
zypper install --type pattern kvm_tools
zypper install libvirt
```

For usage, see [[cross-distro/KVM]].

*References*:

- [6.2.3 Installing specific installation patterns](https://doc.opensuse.org/documentation/leap/virtualization/single-html/book-virtualization/#install-virtualization-components-pattern)

## Basic environment

Install the basic environment by the following commands:

```bash
zypper install -t pattern devel_basis
zypper install pattern:devel_basis # This is the same
```

## Android

### Android Studio

1. Download the package from [the official site](https://developer.android.com/studio).
2. Extract and move the package to `/opt` by the following commands:

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

- https://developer.android.com/studio/install#linux
- https://developer.android.com/codelabs/basic-android-kotlin-compose-install-android-studio#6
- https://tutorialforlinux.com/2019/05/08/how-to-install-android-studio-on-opensuse-15-gnulinux-easy-guide/2/
- https://developer.android.com/studio/command-line
- https://developer.android.com/studio/command-line/variables#envar
- https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux

## C_Cpp

- [ ] todo

1. Install some packages by the following commands:

   ```bash
   zypper install clang
   ```

## Flutter

1. Make sure the following packages exist:

   ```text
   clang-devel
   ninja
   gtk3-devel
   ```

2. Refer to [the official doc]( https://docs.flutter.dev/get-started/install/linux ). I installed it under `$HOME/.flutter`.
3. Add the following to `~/.bash_profile`:

   ```bash
   # Flutter environment
   export PATH="$PATH:$HOME/.flutter/bin"
   ```

4. Use `flutter doctor` to validate the installation.

## Go

1. Refer to [the official doc](https://go.dev/doc/install). I installed it under `$HOME/.go`.
2. Add the following to `~/.bash_profile`:

   ```bash
   # Go environment
   export PATH="$PATH:$HOME/.go/bin"
   ```

*References*:

- [The `GOPATH` environment variable](https://go.dev/doc/gopath_code#GOPATH)

## Java

Use the following commands:

```bash
zypper install java-17-openjdk-devel java-17-openjdk-src
```

*References*:

- https://en.opensuse.org/SDB:Installing_Java
- https://www.simplified.guide/java/jdk-install-suse

## JavaScript

### Node.js

It is recommended to use a Node version manager to install Node.js and npm.

*References*:

- https://docs.npmjs.com/cli/v9/configuring-npm/install

#### fnm

*References*:

- https://github.com/Schniz/fnm

## PowerShell 7

Go to [the official repo](https://github.com/PowerShell/PowerShell/releases) and install an LTS version (e.g. `powershell-lts-7.2.13-1.rh.x86_64.rpm`) via the following command:

```bash
zypper install https://github.com/PowerShell/PowerShell/releases/download/v7.2.13/powershell-lts-7.2.13-1.rh.x86_64.rpm
```

At the time of writing (*Tumbleweed 20230707, PowerShell 7.2.13*), I encountered the following issue and chose to ignore it:

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

`python3` is already available upon system installation.

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

1. [Installing Java](#java) can be performed before installing Scala.

2. I installed it under `$HOME/.coursier` by adding the following to `.bash_profile` before installation:

   ```bash
   # Scala environment
   export COURSIER_BIN_DIR=$HOME/.coursier/bin
   ```

*References*:

- https://get-coursier.io/docs/cli-installation
- https://get-coursier.io/docs/cli-install#installation-directory

## Machine Learning

### TensorFlow 2

It is recommended to run TensorFlow 2 in a container.

1. Install docker. See [docker](#docker).
2. Install NVIDIA Container Toolkit. See [[packages#NVIDIA Container Toolkit]].
3. Install TensorFlow 2 via the following commands:

   ```bash
   sudo docker pull tensorflow/tensorflow:latest-gpu-jupyter
   ```

4. Verify installation via the following commands:

   ```bash
   docker run --runtime=nvidia --gpus all --rm tensorflow/tensorflow:latest-gpu-jupyter nvidia-smi
   ```

*References*:

- https://www.tensorflow.org/install/docker
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#installing-on-suse-15
- [Document supported CUDA/cuDNN versions](https://github.com/tensorflow/tensorflow/issues/57000)
- [Upgrade TF to CUDA 11.4 and cuDNN 8.2](https://github.com/tensorflow/tensorflow/issues/51659)

[//begin]: # "Autogenerated link references for markdown compatibility"
[SSH]: ../../../cross-platform/remote/SSH.md "SSH configs"
[cross-platform/git]: ../../../cross-platform/git.md "Git Configuration"
[packages#VSCode]: packages.md "Package Management"
[notes_development/Docker]: ../../../../notes_development/Docker.md "Developing Using Docker"
[packages#containers]: packages.md "Package Management"
[packages#NVIDIA Container Toolkit]: packages.md "Package Management"
[cross-distro/KVM]: ../../cross-distro/KVM.md "Kernel-based Virtual Machine Usage"
[//end]: # "Autogenerated link references"
