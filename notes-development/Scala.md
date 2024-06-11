# Scala

## Interesting posts

- [Scala's Gitter to Discord migration mistake - Alexandru Nedelcu](https://alexn.org/blog/2022/04/09/scala-gitter-discord-mistake/)

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
