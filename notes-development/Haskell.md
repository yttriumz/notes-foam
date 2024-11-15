# Haskell

Last modified: 2024-11-12 +0000

- [Interesting posts](#interesting-posts)
- [VSCode](#vscode)
  - [`settings.json`](#settingsjson)

## Interesting posts

- [Why Haskell? \| Hacker News](https://news.ycombinator.com/item?id=41518600)
- [My Thoughts on OCaml vs Haskell/Rust in 2023 - Ecosystem - OCaml](https://discuss.ocaml.org/t/my-thoughts-on-ocaml-vs-haskell-rust-in-2023/12027)
  - [me/007-My-Thoughts-on-OCaml-vs-Haskell-Rust-2023.md at master · sidkshatriya/me](https://github.com/sidkshatriya/me/blob/master/007-My-Thoughts-on-OCaml-vs-Haskell-Rust-2023.md)
- [To Haskell or To OCaml : haskell](https://www.reddit.com/r/haskell/comments/6didpj/to_haskell_or_to_ocaml/)
- [Real world Haskell : haskell](https://www.reddit.com/r/haskell/comments/17ydcyk/real_world_haskell/)
- [How can Haskell programmers tolerate Space Leaks? : haskell](https://www.reddit.com/r/haskell/comments/pvosen/how_can_haskell_programmers_tolerate_space_leaks/)
- [Doctest and literate haskell? · Issue #92 · sol/doctest](https://github.com/sol/doctest/issues/92#issuecomment-66225478)
- [Is Haskell (potentially) good for scripting? : r/haskell](https://www.reddit.com/r/haskell/comments/u2y67u/is_haskell_potentially_good_for_scripting/)
- [Why Haskell became my favorite scripting language](https://zignar.net/2021/07/09/why-haskell-became-my-favorite-scripting-language/)
- [Using Haskell as my shell : r/haskell](https://www.reddit.com/r/haskell/comments/rdinq2/using_haskell_as_my_shell/)
- [29 Awesome Open-Source Haskell Projects](https://serokell.io/blog/best-haskell-open-source-projects)

Language:

- [Haskell Cheat Sheet](https://hackage.haskell.org/package/CheatSheet-2.9/src/CheatSheet.pdf)
- [haskell - Where does the name "xs" for pattern matching come from? - Stack Overflow](https://stackoverflow.com/questions/13701099/where-does-the-name-xs-for-pattern-matching-come-from):
  > You might wonder where the variable name `xs` comes from in the Haskell function. This is a common naming pattern for lists: you can read the `s` as a suffix, so the name is essentially “plural of `x`”.

Toolkit:

- [God, why does the best language in the world has to have the worst tooling in the world? : haskell](https://www.reddit.com/r/haskell/comments/18ubkj5/god_why_does_the_best_language_in_the_world_has/)

Tutorials:

- [Haskell MOOC](https://haskell.mooc.fi/)
- [Learn Haskell in Y Minutes](https://learnxinyminutes.com/docs/haskell/)
- [Functional Programming](https://klasses.cs.uchicago.edu/archive/2023/fall/22300-1/)

## VSCode

### `settings.json`

```jsonc
"todo-tree.regex.regex": "((--\\s*($TAGS))|\\{-\\s($TAGS).*(\\n.*)*-})",
// REF: https://github.com/haskell/haskell-language-server/issues/3130
"haskell.plugin.rename.config.crossModule": true
```
