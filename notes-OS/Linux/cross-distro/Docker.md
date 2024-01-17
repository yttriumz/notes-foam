# Docker Usage

Last modified: 2024/01/17 UTC

- [Installation](#installation)
- [Interesting posts](#interesting-posts)
- [Manage Docker as a non-root user (less secure)](#manage-docker-as-a-non-root-user-less-secure)
- [Rootless mode (more secure)](#rootless-mode-more-secure)
- [Configure automatically start behavior](#configure-automatically-start-behavior)
- [Stop all containers](#stop-all-containers)
- [Access containers' ports from the host](#access-containers-ports-from-the-host)
- [Access host's ports in containers](#access-hosts-ports-in-containers)
- [`docker save` \& `docker export`](#docker-save--docker-export)
- [Run a local registry server (image server)](#run-a-local-registry-server-image-server)
- [Container networking](#container-networking)
  - [Default (bridge) network](#default-bridge-network)
  - [Custom bridge network](#custom-bridge-network)
  - [Container defined network](#container-defined-network)
  - [No networking](#no-networking)
- [Container storage](#container-storage)
  - [Types of volume](#types-of-volume)
  - [Check volume information](#check-volume-information)
- [VSCode \& Docker](#vscode--docker)
- [WARP issue](#warp-issue)

## Installation

- openSUSE Tumbleweed: [[Tumbleweed/dev-env#Docker]]

## Interesting posts

- [What is containerd ? \| Docker](https://www.docker.com/blog/what-is-containerd-runtime/)
- [Comparing Container Runtimes: containerd vs. Docker - Earthly Blog](https://earthly.dev/blog/containerd-vs-docker/)
- [Container Guide](https://documentation.suse.com/container/all/single-html/Container-guide/)
- Demystifying Containers:
  - [Demystifying Containers - Part I: Kernel Space \| SUSE Communities](https://www.suse.com/c/demystifying-containers-part-i-kernel-space/)
  - [Demystifying Containers – Part II: Container Runtimes \| SUSE Communities](https://www.suse.com/c/demystifying-containers-part-ii-container-runtimes/)
  - [Demystifying Containers – Part III: Container Images \| SUSE Communities](https://www.suse.com/c/demystifying-containers-part-iii-container-images/)
  - [Demystifying Containers – Part IV: Container Security \| SUSE Communities](https://www.suse.com/c/demystifying-containers-part-iv-container-security/)

## Manage Docker as a non-root user (less secure)

1. Add yourself to the `docker` group via the following commands:

   ```bash
   sudo usermod -aG docker $USER
   ```

2. Log out and Log back in to take effect.

*References*:

- [Manage Docker as a non-root user](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)

## Rootless mode (more secure)

- [ ] todo

*References*:

- [Run the Docker daemon as a non-root user (Rootless mode)](https://docs.docker.com/engine/security/rootless/)

## Configure automatically start behavior

{% raw %}

- Start containers automatically:

  ```bash
  docker run --restart no/on-failure/always/unless-stopped CONTAINER_NAME_OR_ID
  ```

- Check automatically start status:

  ```bash
  docker container ls -q | xargs docker container inspect --format '{{.Name}}: {{.HostConfig.RestartPolicy.Name}}'
  ```

- Change automatically start configs:

  ```bash
  docker update --restart no/on-failure/always/unless-stopped CONTAINER_NAME_OR_ID
  ```

{% endraw %}

*References*:

- [Start containers automatically \| Docker Docs](https://docs.docker.com/config/containers/start-containers-automatically/)
- [configuration - which images dockerd starts automatically? - Server Fault](https://serverfault.com/questions/897463/which-images-dockerd-starts-automatically)

## Stop all containers

Use `docker stop $(docker ps -a -q)`.

*References*:

- [Stop and remove all docker containers](https://stackoverflow.com/questions/45357771/stop-and-remove-all-docker-containers)

## Access containers' ports from the host

{% raw %}

Check a container's IP via the following commands:

- For modern Docker engine:

  ```bash
  docker inspect -f "{{ .NetworkSettings.IPAddress }}" CONTAINER_NAME_OR_ID
  ```

- For older Docker engine (at least *20.10.10, build b485636*):

  ```bash
  docker inspect -f '{{ range.NetworkSettings.Networks }}{{ .IPAddress }}{{ end }}' CONTAINER_NAME_OR_ID
  ```

{% endraw %}

- This is also doable:

  ```bash
  docker exec -it CONTAINER_NAME_OR_ID ip addr
  docker exec -it CONTAINER_NAME_OR_ID ifconfig -a # If `ip` is not available.
  ```

*References*:

- [How to SSH into a Running Docker Container and Run Commands](https://phoenixnap.com/kb/how-to-ssh-into-docker-container#ftoc-heading-2)
- [How to SSH into a Docker Container \| phoenixNAP KB](https://phoenixnap.com/kb/how-to-ssh-into-docker-container#ftoc-heading-2)

## Access host's ports in containers

Check the `docker0` interface IP of the host via `ip addr show docker0`.

*References*:

- [How do I access the host port in a Docker container?](https://bright-softwares.com/blog/en/docker/how-do-i-access-the-host-port-in-a-docker-container#step-1-get-the-hosts-ip-address)

## `docker save` & `docker export`

From Phind:

> `docker save` and `docker export` are two commands used in Docker for creating a static snapshot of a Docker image or container respectively. Here's a detailed explanation:
>
> 1. `docker save`: This command is used to create a snapshot of a Docker image. The snapshot is saved as a tar archive. The main use of `docker save` is to transport a Docker image from one machine to another without having to pull the image from a Docker registry. Here's an example:
>
>    ```bash
>    docker save -o my_image.tar my_image:my_tag
>    ```
>
>    This command will save the Docker image named `my_image` with the tag `my_tag` to a tar file named `my_image.tar`.
>
> 2. `docker export`: This command is used to create a snapshot of a Docker container. The snapshot is saved as a tar archive. The main use of `docker export` is to create a portable version of a running or stopped container that can be imported into another Docker instance. Here's an example:
>
>    ```bash
>    docker export -o my_container.tar my_container_id
>    ```
>
>    This command will save the Docker container with the ID `my_container_id` to a tar file named `my_container.tar`.
>
> The main difference between `docker save` and `docker export` is that `docker save` works on images while `docker export` works on containers. Another important difference is that `docker save` preserves the history of the image and its layers, while `docker export` flattens the changes into a single layer, losing the history.
>
> In summary, use `docker save` when you want to share Docker images and their history between machines, and use `docker export` when you want to share the state of a Docker container between machines.

*References*:

- [docker save \| Docker Docs](https://docs.docker.com/engine/reference/commandline/save/)
- [docker export \| Docker Docs](https://docs.docker.com/engine/reference/commandline/export/)

## Run a local registry server (image server)

Use `docker run -d -p 5000:5000 --restart=always --name registry registry:2`.

*References*:

- [Deploy a registry server \| Docker Docs](https://docs.docker.com/registry/deploying/#run-a-local-registry) (deprecated)
- [Deploy a registry server \| CNCF Distribution](https://distribution.github.io/distribution/about/deploying/)

## Container networking

*References*:

- [Introduction to Container Networking \| SUSE Communities](https://www.suse.com/c/rancher_blog/introduction-to-container-networking/)
- [Relationship between interface "vethxxxxx" and container? - Open Source Projects / DockerEngine - Docker Community Forums](https://forums.docker.com/t/relationship-between-interface-vethxxxxx-and-container/12872/26)

### Default (bridge) network

Docker doesn’t create the `netns` in the default location, `ip netns list` doesn’t show this network namespace. We can create a symlink to the expected location to overcome that limitation:

{% raw %}

```bash
container_id=CONTAINER_NAME_OR_ID
container_netns=$(docker inspect ${container_id} --format '{{ .NetworkSettings.SandboxKey }}')
mkdir -p /var/run/netns
rm -f /var/run/netns/${container_id}
ln -sv ${container_netns} /var/run/netns/${container_id}
```

{% endraw %}

We can test to make sure the `ip` command can list the namespace now:

```bash
ip netns list
```

The other `ip` commands will now work with the namespace too:

```bash
ip netns exec CONTAINER_NAME_OR_ID ip addr
```

We can confirm that this is actually the container’s network namespace with the following command:

```bash
docker exec CONTAINER_NAME_OR_ID ip addr
```

### Custom bridge network

Create a custom bridge network and create two containers that will join it, via the following commands:

```bash
docker network create CUSTOM_NETWORK
docker run -it --rm --name=SOME_CONTAINER-a --network=CUSTOM_NETWORK registry.suse.com/bci/bci-busybox /bin/sh
docker run -it --rm --name=SOME_CONTAINER-b --network=CUSTOM_NETWORK registry.suse.com/bci/bci-busybox /bin/sh
```

### Container defined network

The following commands will launch two containers that share the same network namespace and thus share the same IP address. Services running on one container can talk to services running on the other via the `localhost` address.

```bash
docker run -it --rm --name=SOME_CONTAINER-a registry.suse.com/bci/bci-busybox /bin/sh
docker run -it --rm --name=SOME_CONTAINER-b --network=container:SOME_CONTAINER-a registry.suse.com/bci/bci-busybox /bin/sh
```

### No networking

This mode is useful when the container does not need to communicate with other containers or the outside world. No IP address will be assigned to it, nor can it publish any ports.

```bash
docker run --net=none --name=SOME_CONTAINER registry.suse.com/bci/bci-busybox ip a
```

## Container storage

*References*:

- [Introduction to Container Storage \| SUSE Communities](https://www.suse.com/c/rancher_blog/introduction-to-container-storage/)

### Types of volume

- Named volumes can be created via the following commands:

  ```bash
  docker run -v VOLUME_NAME:/PATH/IN/CONTAINER IMAGE_NAME
  ```

- Anonymous volumes can be created via the following commands:

  ```bash
  docker run -v /PATH/IN/CONTAINER IMAGE_NAME
  ```

  Note that anonymous volumes are removed if the container they are attached to gets removed. This means that you should make sure not to use the `--rm` flag when working with anonymous volumes if you want your data to persist after container shutdown.

- Bind mounts can be created via the following commands:

  ```bash
  docker run -v /PATH/ON/HOST:/PATH/IN/CONTAINER IMAGE_NAME
  ```

  Bind mounts are used to mount an existing path on the host machine into a container.

- Tempfs mount: Provide a writable location that specifically does not persist information after the lifetime of the container. You may be thinking, “why would that be necessary?”

  In a container that does not have a volume mounted, any writes go into the thin R/W layer inserted at runtime. Any writes directed to that layer impact the filesystem as those writes are executed on the underlying host.

  This is typically not a problem unless you write significant amounts of disposable data (such as logs). In that case, you may witness performance degradation as the filesystem needs to handle all of those write calls.

  The `tempfs` mount was created to provide containers with a disposable write path that does not impact filesystem operations. Specifically, the `tempfs` mount is an ephemeral mount that writes directly to memory. You can create this volume by using the `--tempfs` argument.

### Check volume information

- Check the information of a volume via the following commands:

  ```bash
  docker volume inspect VOLUME_NAME
  ```

- Determine which container is using the specific volume via the following commands:

  ```bash
  docker ps -a --filter volume=VOLUME_NAME
  docker ps -a --filter volume=/PATH/IN/CONTAINER
  ```

*References*:

- [How to determine what containers use the docker volume? - Stack Overflow](https://stackoverflow.com/questions/42857575/how-to-determine-what-containers-use-the-docker-volume)

## VSCode & Docker

*References*:

- [Docker in Visual Studio Code](https://code.visualstudio.com/docs/containers/overview)
- [Developing inside a Container](https://code.visualstudio.com/docs/devcontainers/containers)
- [Connect to remote Docker over SSH](https://code.visualstudio.com/docs/containers/ssh)

## WARP issue

At the time of writing (*warp-cli 2023.7.40*), WARP may cause network trouble when building images.

[//begin]: # "Autogenerated link references for markdown compatibility"
[Tumbleweed/dev-env#Docker]: ../openSUSE/Tumbleweed/dev-env.md "OpenSUSE Tumbleweed Development Environment"
[//end]: # "Autogenerated link references"
