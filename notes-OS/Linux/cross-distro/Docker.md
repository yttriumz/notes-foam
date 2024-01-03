# Docker Usage

Last modified: 2023/12/29 UTC

- [Manage Docker as a non-root user (less secure)](#manage-docker-as-a-non-root-user-less-secure)
- [Rootless mode (more secure)](#rootless-mode-more-secure)
- [Configure automatically start behavior](#configure-automatically-start-behavior)
- [Stop all containers](#stop-all-containers)
- [Access containers' ports from the host](#access-containers-ports-from-the-host)
- [Access host's ports in containers](#access-hosts-ports-in-containers)
- [`docker save` \& `docker export`](#docker-save--docker-export)
- [VSCode \& Docker](#vscode--docker)
- [Run a local registry server (image server)](#run-a-local-registry-server-image-server)
- [WARP issue](#warp-issue)

For installation, see:

- openSUSE Tumbleweed: [[Tumbleweed/dev-env#Docker]]

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

*References*:

- [How to SSH into a Running Docker Container and Run Commands](https://phoenixnap.com/kb/how-to-ssh-into-docker-container#ftoc-heading-2)

## Access host's ports in containers

Check the `docker0` interface IP of the host via `ip addr show docker0`.

*References*:

- [How do I access the host port in a Docker container?](https://bright-softwares.com/blog/en/docker/how-do-i-access-the-host-port-in-a-docker-container#step-2-get-the-containers-ip)

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

## VSCode & Docker

*References*:

- [Docker in Visual Studio Code](https://code.visualstudio.com/docs/containers/overview)
- [Developing inside a Container](https://code.visualstudio.com/docs/devcontainers/containers)
- [Connect to remote Docker over SSH](https://code.visualstudio.com/docs/containers/ssh)

## Run a local registry server (image server)

Use `docker run -d -p 5000:5000 --restart=always --name registry registry:2`.

*References*:

- [Deploy a registry server \| Docker Docs](https://docs.docker.com/registry/deploying/#run-a-local-registry) (deprecated)
- [Deploy a registry server \| CNCF Distribution](https://distribution.github.io/distribution/about/deploying/)

## WARP issue

At the time of writing (*warp-cli 2023.7.40*), WARP may cause network trouble when building images.

[//begin]: # "Autogenerated link references for markdown compatibility"
[Tumbleweed/dev-env#Docker]: ..%2FopenSUSE%2FTumbleweed%2Fdev-env.md "OpenSUSE Tumbleweed Development Environment"
[//end]: # "Autogenerated link references"
