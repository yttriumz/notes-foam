# Commonly Used Command-line Tools

Last modified: 2023/11/14 18:26:08

- [Interesting posts](#interesting-posts)
- [Search tools](#search-tools)
  - [`find`](#find)
    - [Interesting posts](#interesting-posts-1)
    - [Ignore case](#ignore-case)
    - [Find only files/directories](#find-only-filesdirectories)
    - [Get rid of "Permission Denied"](#get-rid-of-permission-denied)
  - [`fd` (Rust)](#fd-rust)
  - [ripgrep (`rg`) (Rust)](#ripgrep-rg-rust)
- [File manager](#file-manager)
  - [`joshuto` (Rust)](#joshuto-rust)
  - [`ranger` (Python)](#ranger-python)
- [`ls` alternatives](#ls-alternatives)
  - [`exa` (Rust) (unmaintained)](#exa-rust-unmaintained)
  - [`eza` (Rust) (active fork of `exa`)](#eza-rust-active-fork-of-exa)
  - [`lsd` (Rust)](#lsd-rust)
- [`cat` alternatives](#cat-alternatives)
  - [`bat` (Rust)](#bat-rust)
- [Download from internet](#download-from-internet)
  - [Use `curl` for downloading](#use-curl-for-downloading)
- [Redirect command/script/application output](#redirect-commandscriptapplication-output)
- [Move a foreground task to the background and disown it](#move-a-foreground-task-to-the-background-and-disown-it)

## Interesting posts

- [Rewritten in Rust: Modern Alternatives of Command-Line Tools · Zaiste Programming](https://zaiste.net/posts/shell-commands-rust/)

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

### `exa` (Rust) (unmaintained)

*References*:

- [A modern replacement for ‘ls’.](https://github.com/ogham/exa)
- [Which Ls Replacement Will I Keep Around Exa vs Ls Deluxe](https://www.youtube.com/watch?v=PDu1e6S_gWw)

### `eza` (Rust) (active fork of `exa`)

*References*:

- [A modern, maintained replacement for ls](https://github.com/eza-community/eza)

### `lsd` (Rust)

*References*:

- [The next gen ls command](https://github.com/lsd-rs/lsd)

## `cat` alternatives

### `bat` (Rust)

*References*:

- [A cat(1) clone with wings.](https://github.com/sharkdp/bat)

## Download from internet

### Use `curl` for downloading

Commonly used flags are `-fSLO`.

## Redirect command/script/application output

*References*:

- [how to output text to both screen and file inside a shell script? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/80707/how-to-output-text-to-both-screen-and-file-inside-a-shell-script)
- [terminal - Display output from command and save to file - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/274168/display-output-from-command-and-save-to-file)

## Move a foreground task to the background and disown it

1. Press `Ctrl`+`Z` to suspend the process. This will pause the process and give you a new command prompt.
2. Type `bg` and press `Enter`. This will resume the process in the background, allowing you to continue using the terminal for other commands.

   However, note that this will not prevent the process from being terminated when the terminal session ends. If you want to ensure the process continues running even after the terminal is closed, you should use the `nohup` command or `disown` the process.

3. After moving the process to the background with bg, type `disown %1` and press Enter. Replace `1` with the job number if it's not 1, which can be checked via `jobs`. This will remove the process from the shell's job table, preventing it from receiving the HUP (hangup) signal when the terminal session ends.

   If needed, you can always bring the process back to the foreground with the fg command.
