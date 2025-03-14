---
sitemap:
  lastmod: 2025-03-07 +0000
---

# Visual Studio Code

Last modified: 2025-03-07 +0000

- [Interesting posts](#interesting-posts)
- [Installation](#installation)
- [Multi cursor](#multi-cursor)
- [Cloud Changes (Edit Session)](#cloud-changes-edit-session)
- [Regex search and replace](#regex-search-and-replace)
- [KWallet Related](#kwallet-related)
- [Customization](#customization)
  - [Color customization](#color-customization)
  - [Textmate rules](#textmate-rules)
  - [Disable middle click pasting](#disable-middle-click-pasting)
- [Extensions](#extensions)
  - [Where are extensions installed?](#where-are-extensions-installed)
  - [Todo Tree](#todo-tree)

## Interesting posts

- [Visual Studio Code is designed to fracture](https://ghuntley.com/fracture/)
- [Creating and Using VS Code Snippets: A Beginner's Guide - DEV Community](https://dev.to/serifcolakel/creating-and-using-vs-code-snippets-a-beginners-guide-53ae)
- [vscode/src/vs/base/node/cpuUsage.sh at main · microsoft/vscode](https://github.com/microsoft/vscode/blob/main/src/vs/base/node/cpuUsage.sh)

Concerning issues:

- [Allow to change the font size and font of the workbench · Issue #519 · microsoft/vscode](https://github.com/microsoft/vscode/issues/519)
- [Virtual Space is not implemented. · Issue #13960 · microsoft/vscode](https://github.com/microsoft/vscode/issues/13960)
- [Allow to control the sidebar icon size · Issue #129771 · microsoft/vscode](https://github.com/microsoft/vscode/issues/129771)
- [Show file size and date modified in file explorer. · Issue #164033 · microsoft/vscode](https://github.com/microsoft/vscode/issues/164033)
- [Create new built in git graph · Issue #179053 · microsoft/vscode](https://github.com/microsoft/vscode/issues/179053)
- [Support ligatures in terminal · Issue #34103 · microsoft/vscode](https://github.com/microsoft/vscode/issues/34103)
- [Renaming Terminal Tile does not cause title area to be refreshed · Issue #203961 · microsoft/vscode](https://github.com/microsoft/vscode/issues/203961)
- [ctrl + click "go to definition" clashes with ctrl + click "follow link" · Issue #81520 · microsoft/vscode](https://github.com/microsoft/vscode/issues/81520)
- [Support variables when resolving values in settings · Issue #2809 · microsoft/vscode](https://github.com/microsoft/vscode/issues/2809)
- [Add dropdown for search input history · Issue #23099 · microsoft/vscode](https://github.com/microsoft/vscode/issues/23099)
- [Scroll bar visibility should be configurable · Issue #66000 · microsoft/vscode](https://github.com/microsoft/vscode/issues/66000)
- [Add setting to automatically hide the side bar · Issue #3742 · microsoft/vscode](https://github.com/microsoft/vscode/issues/3742)
- [Can we support CR line endings as well as LF and CRLF? · Issue #35797 · microsoft/vscode](https://github.com/microsoft/vscode/issues/35797)
- [Provide option to opt out of line ending normalisation for files · Issue #127 · microsoft/vscode](https://github.com/microsoft/vscode/issues/127)
- [Add wordwrap indicator · Issue #47855 · microsoft/vscode](https://github.com/microsoft/vscode/issues/47855)
- [Support syntax highlighting with tree-sitter · Issue #50140 · microsoft/vscode](https://github.com/microsoft/vscode/issues/50140)
- [Use fresh environment block on new terminals in Windows · Issue #47816 · microsoft/vscode](https://github.com/microsoft/vscode/issues/47816)

## Installation

- openSUSE: [[package#VSCode]]

## Multi cursor

*References*:

- [Multi cursor selection](https://code.visualstudio.com/docs/getstarted/tips-and-tricks#_multi-cursor-selection)
- [Quick VS Code tip: skip selections when using Ctrl|Cmd + D - DEV Community](https://dev.to/codepo8/quick-vs-code-tip-skip-selections-when-using-ctrlcmd-d-36me)
- [vscode 同时编辑多处，多个光标 快捷键_好菜的程序媛的博客-CSDN博客_vscode多行光标](https://blog.csdn.net/Gomeer/article/details/91417928)

## Cloud Changes (Edit Session)

*References*:

- [Edit Sessions -> Cloud Changes #165877](https://github.com/microsoft/vscode/pull/165877#issuecomment-1357545069)

## Regex search and replace

Some examples:

- Use `(lib[a-z]*[0-9][0-9])` (note the parentheses) to match `libavcodec56`, `libavcodec57`, `libavcodec58`, `libavformat56`, `libavformat57`, `libavformat58`, `libavdevice56`, `libavdevice57`, `libavdevice58` in the search field.

  Refer to them using `$1` in the replace field.

- Use `\$\{([a-zA-Z_]+[a-zA-Z0-9_]*)\}` (note the parentheses) to match `${ENV_VAR}`, `${env}, ${_FOOBAR_}` in the search field.

  Remove the braces (`{}`) around them (while keeping `$`) using `$$$1` in the replace field.

*References*:

- [VS Code: Search-and-Replace Regex - DEV Community](https://dev.to/rfornal/vs-code-search-and-replace-regex-mn2)
- [VS Code: Search-and-Replace Regex with Dollar-Sign - DEV Community](https://dev.to/rfornal/vs-code-search-and-replace-regex-with-dollar-sign-4bph)
- [🔎 vscode \| regex find and replace](https://www.youtube.com/watch?v=xMhKstbdr3k)
- [How to remove empty line in VSCode? - Manish Sharma - Medium](https://medium.com/@manish90/how-to-remove-empty-line-in-vscode-fd3716958787)

## KWallet Related

See [[KDE#KWallet & VSCode]].

## Customization

### Color customization

*References*:

- [Visual Studio Code and VS Code icons and names usage guidelines](https://code.visualstudio.com/brand#brand-colors)
- [VSCode default colors](https://github.com/microsoft/vscode/tree/main/src/vs/platform/theme/common/colors)
- [VSCode terminal colors](https://github.com/microsoft/vscode/blob/main/src/vs/workbench/contrib/terminal/common/terminalColorRegistry.ts)
- [VSCode default themes](https://github.com/microsoft/vscode/tree/main/extensions/theme-defaults/themes)
  - Local path on Linux: `/usr/share/code/resources/app/extensions/theme-defaults/themes/`
- [Colour List \| SAP Help Portal](https://wiki.scn.sap.com/wiki/display/Img/Colour+List)

### Textmate rules

*References*:

- [Language Grammars — TextMate 1.x Manual](https://macromates.com/manual/en/language_grammars)

### Disable middle click pasting

Set `editor.selectionClipboard` to `false`.

*References*:

- [Disable middle-click paste · Issue #14610 · microsoft/vscode](https://github.com/microsoft/vscode/issues/14610)

## Extensions

### Where are extensions installed?

- Windows `%USERPROFILE%\.vscode\extensions`
- macOS `~/.vscode/extensions`
- Linux `~/.vscode/extensions`

*References*:

- [Managing Extensions in Visual Studio Code](https://code.visualstudio.com/docs/editor/extension-marketplace#_where-are-extensions-installed)

### Todo Tree

Some config examples:

- Haskell: `((--\\s*($TAGS))|\\{-\\s($TAGS).*(\\n.*)*-})`
- JavaDoc: `(//|#|<!--|/\\*|^\\s*\\*)\\s*($TAGS)`
- LaTeX: `((//|#|<!--|;|/\\*|^|%|\\\\)\\s*($TAGS)\\{*|^\\s*- \\[ \\])`
- Markdown: `((//|#|<!--|;|/\\*|^)\\s*($TAGS)|^//\\s*\\[x\\]|^//\\s*\\[ \\])`
- Rust: `((//|#|<!--|;|/\\*|^)\\s*($TAGS)|($TAGS)!.*)`

*References*:

- [Configuration Examples · Gruntfuggly/todo-tree Wiki](https://github.com/Gruntfuggly/todo-tree/wiki/Configuration-Examples)

[//begin]: # "Autogenerated link references for markdown compatibility"
[package#VSCode]: Linux/openSUSE/package.md "openSUSE Package Management"
[KDE#KWallet & VSCode]: Linux/KDE.md "KDE Plasma Tweak"
[//end]: # "Autogenerated link references"
