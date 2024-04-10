# Flatpak

Last modified: 2024-04-10 UTC

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
