# Commonly Used Command-line Tools

- [Commonly Used Command-line Tools](#commonly-used-command-line-tools)
  - [Search tool](#search-tool)
    - [`find`](#find)
      - [Ignore case](#ignore-case)
      - [Get rid of "Permission Denied"](#get-rid-of-permission-denied)
      - [Interesting posts](#interesting-posts)
    - [`fd` (Rust)](#fd-rust)
    - [ripgrep (`rg`) (Rust)](#ripgrep-rg-rust)
  - [File manager](#file-manager)
    - [`joshuto` (Rust)](#joshuto-rust)
    - [`ranger` (Python)](#ranger-python)
  - [`ls` replacement](#ls-replacement)
    - [`exa` (Rust)](#exa-rust)
    - [`lsd` (Rust)](#lsd-rust)
  - [`cat` replacement](#cat-replacement)
    - [`bat` (Rust)](#bat-rust)

## Search tool

### `find`

#### Ignore case

Use `-iname` instead of `-name`.

#### Get rid of "Permission Denied"

Add `2>&1 | grep -v "Permission denied"` to the end.

*References*:

- [How to skip "permission denied" errors when running find in Linux? \[duplicate\]](https://unix.stackexchange.com/questions/42841/how-to-skip-permission-denied-errors-when-running-find-in-linux)
- [How can I exclude all "permission denied" messages from "find"?](https://stackoverflow.com/questions/762348/how-can-i-exclude-all-permission-denied-messages-from-find)

#### Interesting posts

- [Ways to Use ‘find’ Command to Search Directories More Efficiently](https://www.tecmint.com/find-directory-in-linux/)

### `fd` (Rust)

*References*:

- https://github.com/sharkdp/fd

### ripgrep (`rg`) (Rust)

*References*:

- https://github.com/BurntSushi/ripgrep

## File manager

### `joshuto` (Rust)

*References*:

- https://github.com/kamiyaa/joshuto

### `ranger` (Python)

*References*:

- https://github.com/ranger/ranger

## `ls` replacement

### `exa` (Rust)

*References*:

- https://github.com/ogham/exa
- [Which Ls Replacement Will I Keep Around Exa vs Ls Deluxe](https://www.youtube.com/watch?v=PDu1e6S_gWw)

### `lsd` (Rust)

*References*:

- https://github.com/lsd-rs/lsd

## `cat` replacement

### `bat` (Rust)

*References*:

- https://github.com/sharkdp/bat
