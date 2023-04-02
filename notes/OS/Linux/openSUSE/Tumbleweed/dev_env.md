# OpenSUSE Development Environment

- [OpenSUSE Development Environment](#opensuse-development-environment)
   - [SSH](#ssh)
   - [git](#git)
   - [docker](#docker)
      - [Manage Docker as a non-root user (less secure)](#manage-docker-as-a-non-root-user-less-secure)
      - [Rootless mode (more secure)](#rootless-mode-more-secure)
      - [Build and run NVidia GPU accelerated Docker containers](#build-and-run-nvidia-gpu-accelerated-docker-containers)
   - [Basic environment](#basic-environment)
   - [Android](#android)
   - [C\_Cpp](#c_cpp)
   - [Flutter](#flutter)
   - [Go](#go)
   - [Java](#java)
   - [Python](#python)
   - [Rust](#rust)
   - [Scala](#scala)
   - [Machine Learning](#machine-learning)
      - [Tensorflow 2](#tensorflow-2)

## SSH

See [[SSH]] for configuration.

## git

See [[git]] for configuration.

## docker

1. Add *Virtualization:containers* repo. See [[packages#containers]].
2. Install docker using the following commands:

   ```bash
   sudo zypper install docker
   ```

3. Verify installation by the following commands:

   ```bash
   sudo docker run --rm hello-world
   ```

### Manage Docker as a non-root user (less secure)

1. Add yourself to the `docker` group by the following commands:

   ```bash
   sudo usermod -aG docker $USER
   ```

2. Log out and Log back in to take effect.

References:

- https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user

### Rootless mode (more secure)

- [ ] todo

References:

- https://docs.docker.com/engine/security/rootless/

### Build and run NVidia GPU accelerated Docker containers

See [[packages#NVIDIA Container Toolkit]]

## Basic environment

Install the basic environment by the following commands:

```bash
sudo zypper install -t pattern devel_basis
```

## Android

1. Download the package from [the official site](https://developer.android.com/studio).
2. Extract and move the package to `/opt`.
3. Add the following to `~/.bash_profile`:

   ```bash
   # Android environment
   export ANDROID_HOME="$HOME/Android/Sdk"
   export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"
   ```

4. Run `/opt/android-studio/bin/studio.sh`.
5. Install `cmdline-tools` from the studio. Go to *File >> Settings >> Appearance & Behavior >> System Settings >> Android SDK >> SDK Tools*.
6. On the welcome page, press `ctrl`+`shift`+`a` and search "device". Create AVD using *Virtual Device Manager*.

References:

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
   sudo zypper install clang
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

1. Refer to [the official doc]( https://go.dev/doc/install ). I installed it under `$HOME/.go`.
2. Add the following to `~/.bash_profile`:

   ```bash
   # Go environment
   export PATH="$PATH:$HOME/.go/bin"
   ```

## Java

Use the following commands:

```bash
sudo zypper install java-17-openjdk-devel java-17-openjdk-src
```

References:

- https://en.opensuse.org/SDB:Installing_Java
- https://www.simplified.guide/java/jdk-install-suse

## Python

`python3` is already installed.

## Rust

1. I installed it under `$HOME/.rust` by adding the following to `.bash_profile` before installation:

   ```bash
   # Rust environment
   export RUSTUP_HOME=$HOME/.rust/.rustup
   export CARGO_HOME=$HOME/.rust/.cargo
   ```

References:

- https://doc.rust-lang.org/book/ch01-01-installation.html

## Scala

1. [Installing Java](#java) can be performed before installing Scala.

2. I installed it under `$HOME/.coursier` by adding the following to `.bash_profile` before installation:

   ```bash
   # Scala environment
   export COURSIER_BIN_DIR=$HOME/.coursier/bin
   ```

References:

- https://get-coursier.io/docs/cli-installation
- https://get-coursier.io/docs/cli-install#installation-directory

## Machine Learning

### Tensorflow 2

It is recommended to run tensorflow 2 in a container.

1. Install docker. See [docker](#docker).
2. Install NVIDIA Container Toolkit. See [[packages#NVIDIA Container Toolkit]].
3. Install tensorflow 2 by the following commands:

   ```bash
   sudo docker pull tensorflow/tensorflow:latest-gpu-jupyter
   ```

4. Verify installation by the following commands:

   ```bash
   docker run --rm --runtime=nvidia --gpus all --rm tensorflow/tensorflow:latest-gpu-jupyter nvidia-smi
   ```

References:

- https://www.tensorflow.org/install/docker
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#installing-on-suse-15
- [Document supported CUDA/cuDNN versions](https://github.com/tensorflow/tensorflow/issues/57000)
- [Upgrade TF to CUDA 11.4 and cuDNN 8.2](https://github.com/tensorflow/tensorflow/issues/51659)

[//begin]: # "Autogenerated link references for markdown compatibility"
[SSH]: ../../../cross-platform/remote/SSH.md "SSH configs"
[git]: ../../../cross-platform/VCS/git.md "Git Operations"
[packages#containers]: packages.md "Package Management"
[packages#NVIDIA Container Toolkit]: packages.md "Package Management"
[//end]: # "Autogenerated link references"
