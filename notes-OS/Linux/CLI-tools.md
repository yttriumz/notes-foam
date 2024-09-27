---
sitemap:
  lastmod: 2024-09-23 +0000
---

# Command-line Tools

Last modified: 2024-09-23 +0000

- [Interesting posts](#interesting-posts)
- [Text processing](#text-processing)
- [Search tools](#search-tools)
  - [`find`](#find)
  - [`fd` (Rust)](#fd-rust)
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
- [Archive and compress](#archive-and-compress)
- [Move a foreground task to the background and keep it running](#move-a-foreground-task-to-the-background-and-keep-it-running)

## Interesting posts

- [Rewritten in Rust: Modern Alternatives of Command-Line Tools · Zaiste Programming](https://zaiste.net/posts/shell-commands-rust/)
- [How can I show lines in common (reverse diff)? - Stack Overflow](https://stackoverflow.com/questions/746458/how-can-i-show-lines-in-common-reverse-diff)
- [How to diff large files on Linux - Super User](https://superuser.com/questions/174283/how-to-diff-large-files-on-linux)
- [What the first five lines of Linux’s top command tell you \| Enable Sysadmin](https://www.redhat.com/sysadmin/interpret-top-output)
- [linux - How does "cp" handle open files? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/50466/how-does-cp-handle-open-files)
- [CPU Profiling Tools on Linux - euccas.github.io](http://euccas.github.io/blog/20170827/cpu-profiling-tools-on-linux.html)

## Text processing

See [[text-processing]].

## Search tools

### `find`

- Ignore case: Use `-iname` instead of `-name`.
- Find only files/directories:
  - For files, use `-type f`.
  - For directories, use `-type d`.
- Exclude paths: Use `-not -path "SOME/PATH/*"`.
- Get rid of "Permission Denied": Append `2>&1 | grep -v "Permission denied"` to the end.

*References*:

- [Ways to Use ‘find’ Command to Search Directories More Efficiently](https://www.tecmint.com/find-directory-in-linux/)
- [In bash: How to find and delete directories containing a specific file, only if the file is older than X minutes - Super User](https://superuser.com/questions/1499291/in-bash-how-to-find-and-delete-directories-containing-a-specific-file-only-if)
- [How to mark directories in the output of the `find` command?](https://unix.stackexchange.com/questions/652076/how-to-mark-directories-in-the-output-of-the-find-command)
- [linux - How do I exclude a directory when using `find`? - Stack Overflow](https://stackoverflow.com/questions/4210042/how-do-i-exclude-a-directory-when-using-find)
- [How to skip "permission denied" errors when running find in Linux? \[duplicate\]](https://unix.stackexchange.com/questions/42841/how-to-skip-permission-denied-errors-when-running-find-in-linux)
- [How can I exclude all "permission denied" messages from "find"?](https://stackoverflow.com/questions/762348/how-can-i-exclude-all-permission-denied-messages-from-find)

### `fd` (Rust)

*References*:

- [A simple, fast and user-friendly alternative to 'find'](https://github.com/sharkdp/fd)

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

*References*:

- [Exit code - everything curl](https://everything.curl.dev/cmdline/exitcode.html)

### Hurl (Rust)

*References*:

- [Orange-OpenSource/hurl: Hurl, run and test HTTP requests with plain text.](https://github.com/Orange-OpenSource/hurl)

## Archive and compress

*References*:

- [command line - How to obtain maximum compression with .tar.gz? - Super User](https://superuser.com/questions/514260/how-to-obtain-maximum-compression-with-tar-gz)
- [bash - How to add progress bar to a somearchive.tar.xz extract - Stack Overflow](https://stackoverflow.com/questions/19372373/how-to-add-progress-bar-to-a-somearchive-tar-xz-extract)

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

*References*:

- [terminal - nohup vs screen -- which is better for long running process? - Stack Overflow](https://stackoverflow.com/questions/20766300/nohup-vs-screen-which-is-better-for-long-running-process)
- [浅析Linux中使用nohup及screen运行后台任务的示例和区别-腾讯云开发者社区-腾讯云](https://cloud.tencent.com/developer/article/1722221)

[//begin]: # "Autogenerated link references for markdown compatibility"
[text-processing]: text-processing.md "Text Processing on Linux"
[//end]: # "Autogenerated link references"