# Commonly Used Command-line Tools

- [Search tools](#search-tools)
  - [`find`](#find)
    - [Interesting posts](#interesting-posts)
    - [Ignore case](#ignore-case)
    - [Find only files/directories](#find-only-filesdirectories)
    - [Get rid of "Permission Denied"](#get-rid-of-permission-denied)
  - [`fd` (Rust)](#fd-rust)
  - [ripgrep (`rg`) (Rust)](#ripgrep-rg-rust)
- [File manager](#file-manager)
  - [`joshuto` (Rust)](#joshuto-rust)
  - [`ranger` (Python)](#ranger-python)
- [`ls` alternatives](#ls-alternatives)
  - [`exa` (Rust)](#exa-rust)
  - [`lsd` (Rust)](#lsd-rust)
- [`cat` alternatives](#cat-alternatives)
  - [`bat` (Rust)](#bat-rust)
- [Network tools](#network-tools)
  - [`ip route`](#ip-route)
  - [`curl` for downloading](#curl-for-downloading)

## Search tools

### `find`

#### Interesting posts

- [Ways to Use ‘find’ Command to Search Directories More Efficiently](https://www.tecmint.com/find-directory-in-linux/)

#### Ignore case

Use `-iname` instead of `-name`.

#### Find only files/directories

For files use `! -type d`; for directories use `-type d`.

*References*:

- [How to mark directories in the output of the `find` command?](https://unix.stackexchange.com/questions/652076/how-to-mark-directories-in-the-output-of-the-find-command)

#### Get rid of "Permission Denied"

Add `2>&1 | grep -v "Permission denied"` to the end.

*References*:

- [How to skip "permission denied" errors when running find in Linux? \[duplicate\]](https://unix.stackexchange.com/questions/42841/how-to-skip-permission-denied-errors-when-running-find-in-linux)
- [How can I exclude all "permission denied" messages from "find"?](https://stackoverflow.com/questions/762348/how-can-i-exclude-all-permission-denied-messages-from-find)

### `fd` (Rust)

*References*:

- [A simple, fast and user-friendly alternative to 'find'](https://github.com/sharkdp/fd)

### ripgrep (`rg`) (Rust)

*References*:

- [ripgrep recursively searches directories for a regex pattern while respecting your gitignore](https://github.com/BurntSushi/ripgrep)
- [ripgrep is faster than {grep, ag, git grep, ucg, pt, sift}](https://blog.burntsushi.net/ripgrep/)

## File manager

### `joshuto` (Rust)

*References*:

- [ranger-like terminal file manager written in Rust](https://github.com/kamiyaa/joshuto)

### `ranger` (Python)

*References*:

- [A VIM-inspired filemanager for the console](https://github.com/ranger/ranger)

## `ls` alternatives

### `exa` (Rust)

*References*:

- [A modern replacement for ‘ls’.](https://github.com/ogham/exa)
- [Which Ls Replacement Will I Keep Around Exa vs Ls Deluxe](https://www.youtube.com/watch?v=PDu1e6S_gWw)

### `lsd` (Rust)

*References*:

- [The next gen ls command](https://github.com/lsd-rs/lsd)

## `cat` alternatives

### `bat` (Rust)

*References*:

- [A cat(1) clone with wings.](https://github.com/sharkdp/bat)

## Network tools

### `ip route`

*References*:

- [What's the meaning of `linkdown` and `onlink` in Linux Route?](https://unix.stackexchange.com/questions/579087/whats-the-meaning-of-linkdown-and-onlink-in-linux-route)
- [Interface following a link](https://serverfault.com/questions/1079631/interface-following-a-link)

### `curl` for downloading

Commonly used flags are `-fSLO`.
