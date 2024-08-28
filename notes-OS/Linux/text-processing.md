---
sitemap:
  lastmod: 2024-08-28 +0000
---

# Text Processing on Linux

- [Interesting posts](#interesting-posts)
- [`grep`](#grep)
- [ripgrep (`rg`) (Rust)](#ripgrep-rg-rust)

## Interesting posts

- [go to character in vim - Stack Overflow](https://stackoverflow.com/questions/543738/go-to-character-in-vim)
- [unix - What does the ^M character mean in Vim? - Stack Overflow](https://stackoverflow.com/questions/5843495/what-does-the-m-character-mean-in-vim)
- [Vim documentation: digraph](https://vimdoc.sourceforge.net/htmldoc/digraph.html#digraph-table)
- [How to remove carriage return in Linux or Unix - nixCraft](https://www.cyberciti.biz/faq/how-to-remove-carriage-return-in-linux-or-unix/)
- [splitting a huge line of file into multiple lines with fixed number of columns](https://www.unix.com/shell-programming-and-scripting/166969-splitting-huge-line-file-into-multiple-lines-fixed-number-columns.html)
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

## `grep`

*References*:

- [grep command in Unix/Linux - GeeksforGeeks](https://www.geeksforgeeks.org/grep-command-in-unixlinux/)
- [Can grep show only words that match search pattern? - Stack Overflow](https://stackoverflow.com/questions/1546711/can-grep-show-only-words-that-match-search-pattern)
- [linux - How to 'grep' a continuous stream? - Stack Overflow](https://stackoverflow.com/questions/7161821/how-to-grep-a-continuous-stream)

## ripgrep (`rg`) (Rust)

*References*:

- [ripgrep recursively searches directories for a regex pattern while respecting your gitignore](https://github.com/BurntSushi/ripgrep)
- [ripgrep is faster than {grep, ag, git grep, ucg, pt, sift}](https://blog.burntsushi.net/ripgrep/)
