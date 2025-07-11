---
sitemap:
  lastmod: 2025-07-10 +0000
---

# Clojure Tips

Last modified: 2025-07-10 +0000

- [Interesting posts](#interesting-posts)
- [Coding style](#coding-style)
- [`deps.edn`](#depsedn)
- [Namespace](#namespace)
- [Get paths](#get-paths)
- [Return value](#return-value)
- [Time format](#time-format)
- [Macro](#macro)
- [States](#states)

## Interesting posts

- [Help regarding .clj, .cljc and .cljs . : r/Clojure](https://www.reddit.com/r/Clojure/comments/5ydj3i/help_regarding_clj_cljc_and_cljs/)
- [Clojure - Destructuring in Clojure](https://clojure.org/guides/destructuring)
- [Clojure Destructuring Tutorial and Cheat Sheet](https://gist.github.com/john2x/e1dca953548bfdfb9844)
- [Clojure Guide - How to use Loop and Recur - Guide - The freeCodeCamp Forum](https://forum.freecodecamp.org/t/clojure-guide-how-to-use-loop-and-recur/18418)
- [Clojure: Why a function should be `declare` if it is called before definition in the source code - Stack Overflow](https://stackoverflow.com/questions/33143936/clojure-why-a-function-should-be-declare-if-it-is-called-before-definition-in)
- [clojure - Two functions which call each other recursively - Stack Overflow](https://stackoverflow.com/questions/18421453/two-functions-which-call-each-other-recursively)
- [clojure spec vs plumatic schema - Clojure Q&A](https://ask.clojure.org/index.php/13817/clojure-spec-vs-plumatic-schema)
- [Seqs and Colls in Clojure](https://www.brainonfire.net/files/seqs-and-colls/main.html)
- [clojure - How to create a map from a group of bindings using their names as keys? - Stack Overflow](https://stackoverflow.com/questions/11705525/how-to-create-a-map-from-a-group-of-bindings-using-their-names-as-keys)
- [Probably easy question: alternatives to early return : r/Clojure](https://www.reddit.com/r/Clojure/comments/mz8cux/probably_easy_question_alternatives_to_early/)
- [Clojure's deadly sin - Clojure Goes Fast](https://clojure-goes-fast.com/blog/clojures-deadly-sin/)
- [Tail Recursion In Clojure \| 8th Light](https://8thlight.com/insights/tail-recursion-in-clojure)
- [`every-pred` and `some-fn` : r/Clojure](https://www.reddit.com/r/Clojure/comments/e5ii8c/everypred_and_somefn/)
- [Unrolling every-pred and some-fn](https://blog.ambrosebs.com/2022/09/10/unrolling-some-fn-every-pred.html)
- [Infinite rest](https://blog.ambrosebs.com/2024/07/09/infinite-rest.html)
- [Clojure lazy evaluation and stack overflow exceptions \| by Nikos Fertakis \| Medium](https://medium.com/@nikosfertakis/clojure-lazy-evaluation-and-stack-overflow-exceptions-1b8ee732ba0b)
- [Laziness in Clojure. As you probably already know, Clojure… \| by Pat Wentz \| Medium](https://medium.com/@pwentz/laziness-in-clojure-3d83645bf7f3)
- [Avoid infinite recursion with lazy sequences : r/Clojure](https://www.reddit.com/r/Clojure/comments/gomjr9/avoid_infinite_recursion_with_lazy_sequences/)
- [clojure - Lazy sequence using loop/recur? - Stack Overflow](https://stackoverflow.com/questions/21712145/lazy-sequence-using-loop-recur)
- [When should I prefer comp and partial to anonymous functions? - Clojure Q&A](https://ask.clojure.org/index.php/8373/when-should-prefer-comp-and-partial-to-anonymous-functions)


## Coding style

*References*:

- [do’s and don’ts – Digital Digressions by Stuart Sierra](https://stuartsierra.com/tag/dos-and-donts)
- [bbatsov/clojure-style-guide: A community coding style guide for the Clojure programming language](https://github.com/bbatsov/clojure-style-guide)
- [Metabase Clojure Style Guide · metabase/metabase Wiki](https://github.com/metabase/metabase/wiki/Metabase-Clojure-Style-Guide)
- [Question marks in Clojure \| (:dev/notes vlaaad)](https://vlaaad.github.io/2019-03-30/question-marks-in-clojure#:~:text=Don't%3A%20Booleans&text=Also%2C%20using%20question%20mark%20here,are%20either%20functions%20or%20booleans.)

## `deps.edn`

- The Clojure CLI can use any version of Clojure. See [How to declare a super specific version of Clojure in the deps.edn? - Questions & Help / How to? - ClojureVerse](https://clojureverse.org/t/how-to-declare-a-super-specific-version-of-clojure-in-the-deps-edn/6751/2).

## Namespace

*References*:

- [How to ns – Digital Digressions by Stuart Sierra](https://stuartsierra.com/2016/08/27/how-to-ns)
- [Splitting a Clojure namespace over multiple files - Stack Overflow](https://stackoverflow.com/questions/4690758/splitting-a-clojure-namespace-over-multiple-files)
- [Clojure's keyword namespacing convention Considered Harmful : r/Clojure](https://www.reddit.com/r/Clojure/comments/hhyb26/clojures_keyword_namespacing_convention/)

## Get paths

- Use `(System/getProperty "user.dir")` or `(-> "." java.io.File. .getAbsolutePath)` to get the working directory.
- Use `(System/getProperty "java.class.path")` or `clj -Spath` to get classpath.

## Return value

*References*:

- [Should the clojure "-main" function have a return value? - Community Center / Beginners - ClojureVerse](https://clojureverse.org/t/should-the-clojure-main-function-have-a-return-value/7089/4)

## Time format

*References*:

- [date - Clojure: what's the way to have current time string with babashka with least dependency? - Stack Overflow](https://stackoverflow.com/questions/62969992/clojure-whats-the-way-to-have-current-time-string-with-babashka-with-least-dep)
- See also [[Java#Time format]].

## Macro

*References*:

- [I do not use macros, am I doing it wrong? : r/Clojure](https://www.reddit.com/r/Clojure/comments/97cprw/i_do_not_use_macros_am_i_doing_it_wrong/)
- [When To Use a Macro in Clojure](https://ericnormand.me/mini-guide/when-to-use-a-macro-in-clojure)

## States

*References*:

- [Clojure differences between Ref, Var, Agent, Atom, with examples - Stack Overflow](https://stackoverflow.com/questions/9132346/clojure-differences-between-ref-var-agent-atom-with-examples)


[//begin]: # "Autogenerated link references for markdown compatibility"
[Java#Time format]: ../Java.md "Java"
[//end]: # "Autogenerated link references"
