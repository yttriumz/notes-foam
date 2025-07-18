---
sitemap:
  lastmod: 2025-03-27 +0000
---

# Flatpak

Last modified: 2025-03-27 +0000

## Interesting posts

- [Flatpak Is Not the Future](https://ludocode.com/blog/flatpak-is-not-the-future)
- [Hacker News discussion](https://news.ycombinator.com/item?id=29316024)

## Add repositories

Add *flathub* repository via the following commands:

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

*References*:

- [The community guide](https://opensuse.github.io/openSUSE-docs-revamped-temp/best_of_post/#setup-your-tumbleweed-for-flatpaks)

## Uninstall unused packages

Use `flatpak uninstall --unused`.

## Uninstall and delete data

Use `flatpak uninstall --delete-data SOME_PACKAGE`.

- [Looking for a command to reset app data : r/flatpak](https://www.reddit.com/r/flatpak/comments/tbualg/looking_for_a_command_to_reset_app_data/)

## Run on NVidia GPU

```bash
# for OpenGL
flatpak override --env="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia" full.application.Name
# for Vulkan
flatpak override --env="__NV_PRIME_RENDER_OFFLOAD=1" full.application.Name
```

*References*:

- [How do you offload a flatpak application to run on the nvidia graphics card when using prime? - Ask Ubuntu](https://askubuntu.com/questions/1316566/how-do-you-offload-a-flatpak-application-to-run-on-the-nvidia-graphics-card-when)
