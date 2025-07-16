---
sitemap:
  lastmod: 2024-11-22 +0000
---

# Scala

Last modified: 2024-11-22 +0000

## Interesting posts

- [switching from Clojure to Scala : r/scala](https://www.reddit.com/r/scala/comments/1ct6k38/switching_from_clojure_to_scala/)
- [Scala's Gitter to Discord migration mistake - Alexandru Nedelcu](https://alexn.org/blog/2022/04/09/scala-gitter-discord-mistake/)

Language:

Toolkit:

- [Better Shell Scripting with Scala-CLI - Xebia](https://xebia.com/blog/better-shell-scripting-with-scala-cli/)

Tutorials:

- [Scripting with Scala - Alexandru Nedelcu](https://alexn.org/blog/2022/09/13/scripting-with-scala/)

## Develop tools tips

*References*:

- [![Multiple Roots in a Workspace](https://img.youtube.com/vi/alNInbRuQ_Y/0.jpg)](https://www.youtube.com/watch?v=alNInbRuQ_Y)
- Use `console` in `sbt`: https://www.baeldung.com/scala/repl

## VSCode

### `settings.json`

```jsonc
"files.watcherExclude": {
    // Scala
    "**/.bloop": true,
    "**/.metals": true,
    "**/.ammonite": true
},
```
