---
sitemap:
  lastmod: 2024-07-09 +0000
---

# Container Image

Last modified: 2024-07-09 +0000

**NOTE**: This note assumes that images are built using Docker by default.

- [Interesting posts](#interesting-posts)
- [Dockerfile](#dockerfile)
  - [`CMD` \& `ENTRYPOINT`](#cmd--entrypoint)
- [GitHub Container Registry](#github-container-registry)
- [CentOS image](#centos-image)
- [WARP issue](#warp-issue)

## Interesting posts

- [How to see docker image contents - Stack Overflow](https://stackoverflow.com/questions/44769315/how-to-see-docker-image-contents)
- [wagoodman/dive: A tool for exploring each layer in a docker image](https://github.com/wagoodman/dive)
- [Multi-platform images \| Docker Docs](https://docs.docker.com/build/building/multi-platform/)
- [Multi-arch build and images, the simple way \| Docker](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/)
- [How to run a cron job inside a docker container? - Stack Overflow](https://stackoverflow.com/questions/37458287/how-to-run-a-cron-job-inside-a-docker-container)

## Dockerfile

*References*:

- [Dockerfile reference \| Docker Docs](https://docs.docker.com/engine/reference/builder/)
- [Overview of best practices for writing Dockerfiles \| Docker Docs](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
  > When you run an image and generate a container, you add a new writable layer, also called the container layer, on top of the underlying layers. All changes made to the running container, such as writing new files, modifying existing files, and deleting files, are written to this writable container layer.
- [shell - Why && rather than a new RUN - Stack Overflow](https://stackoverflow.com/questions/47051993/why-rather-than-a-new-run)

### `CMD` & `ENTRYPOINT`

From Phind:

> The `CMD` and `ENTRYPOINT` instructions in a Dockerfile serve similar purposes in that they both specify what command should be run when a container is started from the image. However, there are some key differences between the two:
>
> 1. **Overriding**: The command specified with `CMD` can be easily overridden by specifying a different command at the end of the `docker run` command. On the other hand, the command specified with `ENTRYPOINT` cannot be overridden in this way (it can only be overridden by specifying a new `ENTRYPOINT` in the `docker run` command with the `--entrypoint` flag).
>
> 2. **Combining `CMD` and `ENTRYPOINT`**: If both `CMD` and `ENTRYPOINT` are used in the same Dockerfile, `CMD` will be used as arguments to `ENTRYPOINT`. For example, if your Dockerfile has `ENTRYPOINT ["python3"]` and `CMD ["app.py"]`, the command that will be run when a container is started from the image is `python3 app.py`.
>
> 3. **Form**: `ENTRYPOINT` has two forms: the exec form (which is `ENTRYPOINT ["executable", "param1", "param2"]`) and the shell form (which is `ENTRYPOINT command param1 param2`). The exec form does not invoke a command shell which means it does not do variable substitution. The shell form does invoke a command shell which means it does do variable substitution.

## GitHub Container Registry

*References*:

- [GitHub Container Registry · Codefresh \| Docs](https://codefresh.io/docs/docs/integrations/docker-registries/github-container-registry/)

## CentOS image

- Update the mirror address by adding the following to `Dockerfile`:

  ```dockerfile
  RUN cd /etc/yum.repos.d/
  RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
  RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
  ```

*References*:

- [Error: Failed to download metadata for repo 'appstream': Cannot prepare internal mirrorlist: No URLs in mirrorlist](https://stackoverflow.com/questions/70963985/error-failed-to-download-metadata-for-repo-appstream-cannot-prepare-internal)
- [yum安装时提示：This system is not registered with an entitlement server. You can use subscription-manager to register. - Ajunyu - 博客园](https://www.cnblogs.com/ajunyu/p/13297449.html)
- [Plesk or system updates fail on CentOS 7: Could not resolve host: mirrorlist.centos.org – Plesk](https://support.plesk.com/hc/en-us/articles/24575503258647-Plesk-or-system-updates-fail-on-CentOS-7-Could-not-resolve-host-mirrorlist-centos-org)

## WARP issue

At the time of writing (*warp-cli 2023.7.40*), WARP may cause network trouble when building images. E.g yum cannot fetch remote repositories.
