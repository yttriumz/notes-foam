---
sitemap:
  lastmod: 2024-09-23 +0000
---

# Text Processing on Linux

- [Interesting posts](#interesting-posts)
- [`awk`](#awk)
- [`sed`](#sed)
- [`grep`](#grep)
- [ripgrep (Rust)](#ripgrep-rust)
- [`wc`](#wc)
- [`iconv`](#iconv)

## Interesting posts

- [go to character in vim - Stack Overflow](https://stackoverflow.com/questions/543738/go-to-character-in-vim)
- [unix - What does the ^M character mean in Vim? - Stack Overflow](https://stackoverflow.com/questions/5843495/what-does-the-m-character-mean-in-vim)
- [Vim documentation: digraph](https://vimdoc.sourceforge.net/htmldoc/digraph.html#digraph-table)
- [How to remove carriage return in Linux or Unix - nixCraft](https://www.cyberciti.biz/faq/how-to-remove-carriage-return-in-linux-or-unix/)
- [splitting a huge line of file into multiple lines with fixed number of columns](https://www.unix.com/shell-programming-and-scripting/166969-splitting-huge-line-file-into-multiple-lines-fixed-number-columns.html)
- [shell - How to delete from a text file, all lines that contain a specific string? - Stack Overflow](https://stackoverflow.com/questions/5410757/how-to-delete-from-a-text-file-all-lines-that-contain-a-specific-string)
- [linux - How to sort a file in-place? - Stack Overflow](https://stackoverflow.com/questions/29244351/how-to-sort-a-file-in-place)
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

## `awk`

*References*:

- [The GNU Awk User’s Guide](https://www.gnu.org/software/gawk/manual/gawk.html)
  - [String Functions (The GNU Awk User’s Guide)](https://www.gnu.org/software/gawk/manual/html_node/String-Functions.html)
  - [For Statement (The GNU Awk User’s Guide)](https://www.gnu.org/software/gawk/manual/html_node/For-Statement.html)
  - [Arrays Summary (The GNU Awk User’s Guide)](https://www.gnu.org/software/gawk/manual/html_node/Arrays-Summary.html)
- [bash - Writing to multiple files with awk - Stack Overflow](https://stackoverflow.com/questions/26343823/writing-to-multiple-files-with-awk)

## `sed`

*References*:

- [scripting - How can I remove the first line of a text file using bash/sed script? - Stack Overflow](https://stackoverflow.com/questions/339483/how-can-i-remove-the-first-line-of-a-text-file-using-bash-sed-script)
- [Remove First n Lines of a Large Text File - Ask Ubuntu](https://askubuntu.com/questions/410196/remove-first-n-lines-of-a-large-text-file)

## `grep`

*References*:

- [grep command in Unix/Linux - GeeksforGeeks](https://www.geeksforgeeks.org/grep-command-in-unixlinux/)
- [Grep: how to add an "OR" condition? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/25821/grep-how-to-add-an-or-condition)
- [Can grep show only words that match search pattern? - Stack Overflow](https://stackoverflow.com/questions/1546711/can-grep-show-only-words-that-match-search-pattern)
- [linux - How to 'grep' a continuous stream? - Stack Overflow](https://stackoverflow.com/questions/7161821/how-to-grep-a-continuous-stream)

## ripgrep (Rust)

*References*:

- [ripgrep recursively searches directories for a regex pattern while respecting your gitignore](https://github.com/BurntSushi/ripgrep)
- [ripgrep is faster than {grep, ag, git grep, ucg, pt, sift}](https://blog.burntsushi.net/ripgrep/)

## `wc`

*References*:

- [bug#24532: GNU wc --lines doesn't report last line when that doesn't end](https://lists.gnu.org/archive/html/bug-coreutils/2016-09/msg00035.html)

## `iconv`

*References*:

- [libiconv - GNU Project - Free Software Foundation (FSF)](https://www.gnu.org/software/libiconv/)
