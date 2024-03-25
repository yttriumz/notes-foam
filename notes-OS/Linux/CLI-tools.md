# Commonly Used Command-line Tools

Last modified: 2024/02/07 UTC

- [Interesting posts](#interesting-posts)
- [Search tools](#search-tools)
  - [`find`](#find)
    - [Ignore case](#ignore-case)
    - [Find only files/directories](#find-only-filesdirectories)
    - [Exclude paths](#exclude-paths)
    - [Get rid of "Permission Denied"](#get-rid-of-permission-denied)
  - [`fd` (Rust)](#fd-rust)
  - [ripgrep (`rg`) (Rust)](#ripgrep-rg-rust)
- [File manager](#file-manager)
  - [`joshuto` (Rust)](#joshuto-rust)
  - [`ranger` (Python)](#ranger-python)
- [File listing (`ls`)](#file-listing-ls)
  - [`exa` (Rust) (unmaintained)](#exa-rust-unmaintained)
  - [`eza` (Rust) (active fork of `exa`)](#eza-rust-active-fork-of-exa)
  - [`lsd` (Rust)](#lsd-rust)
- [`cat` alternatives](#cat-alternatives)
  - [`bat` (Rust)](#bat-rust)
- [Download from network](#download-from-network)
  - [`curl`](#curl)
  - [Hurl (Rust)](#hurl-rust)
- [Move a foreground task to the background and keep it running](#move-a-foreground-task-to-the-background-and-keep-it-running)
- [`iconv`](#iconv)

## Interesting posts

- [Rewritten in Rust: Modern Alternatives of Command-Line Tools · Zaiste Programming](https://zaiste.net/posts/shell-commands-rust/)
- From Phind:
  > Yes, there are other ways to read a file's content in a shell script besides using `cat` or the `<` operator. Here are a few alternatives:
  >
  > - `read` command: The `read` command can be used in a loop to read a file line by line.
  >
  >   ```bash
  >   while IFS= read -r line
  >   do
  >     echo "$line"
  >   done < "$filename"
  >   ```
  >
  > - `awk` command: `awk` is a powerful text-processing command. It can be used to read a file.
  >
  >   ```bash
  >   awk '{print}' "$filename"
  >   ```
  >
  > - `sed` command: `sed` is a stream editor for filtering and transforming text. It can be used to print out a file.
  >
  >   ```bash
  >   sed -n 'p' "$filename"
  >   ```
  >
  > - `grep` command: `grep` is used to search text. You can use it to print out all lines in a file.
  >
  >   ```bash
  >   grep . "$filename"
  >   ```
  >
  > Please note that these commands are more complex and powerful than `cat` and the `<` operator. If all you need is to read a file's content, `cat` or the `<` operator are the simplest and most efficient options. The other commands are useful if you need to process the file's content in some way, such as filtering or transforming the text.

## Search tools

### `find`

*References*:

- [Ways to Use ‘find’ Command to Search Directories More Efficiently](https://www.tecmint.com/find-directory-in-linux/)

#### Ignore case

Use `-iname` instead of `-name`.

#### Find only files/directories

- For files, use `-type f`.
- For directories, use `-type d`.

*References*:

- [How to mark directories in the output of the `find` command?](https://unix.stackexchange.com/questions/652076/how-to-mark-directories-in-the-output-of-the-find-command)

#### Exclude paths

*References*:

- [linux - How do I exclude a directory when using `find`? - Stack Overflow](https://stackoverflow.com/questions/4210042/how-do-i-exclude-a-directory-when-using-find)

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

## File listing (`ls`)

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

## Download from network

### `curl`

Commonly used flags for downloading are `-fSLO`.

### Hurl (Rust)

*References*:

- [Orange-OpenSource/hurl: Hurl, run and test HTTP requests with plain text.](https://github.com/Orange-OpenSource/hurl)

## Move a foreground task to the background and keep it running

From Phind:

> 1. Press `Ctrl`+`Z` to suspend the process. This will pause the process and give you a new command prompt.
> 2. Type `bg` and press `Enter`. This will resume the process in the background, allowing you to continue using the terminal for other commands.
>
>    However, note that this will not prevent the process from being terminated when the terminal session ends. If you want to ensure the process continues running even after the terminal is closed, you should use the `nohup` command or `disown` the process.
>
> 3. After moving the process to the background with `bg`, type `disown %1` and press `Enter`. Replace `1` with the job number if it's not 1, which can be checked via `jobs`. This will remove the process from the shell's job table, preventing it from receiving the `HUP` (hangup) signal when the terminal session ends.
>
>    If needed, you can always bring the process back to the foreground with the `fg` command.

## `iconv`

*References*:

- [libiconv - GNU Project - Free Software Foundation (FSF)](https://www.gnu.org/software/libiconv/)
