# JavaScript/TypeScript

- [Interesting posts](#interesting-posts)
- [VSCode config](#vscode-config)
- [`.eslintrc.json`](#eslintrcjson)

## Interesting posts

- [What is the difference between yarn run and npm start?](https://stackoverflow.com/questions/40619269/what-is-the-difference-between-yarn-run-and-npm-start)
- [Get loop counter/index using for…of syntax in JavaScript](https://stackoverflow.com/questions/10179815/get-loop-counter-index-using-for-of-syntax-in-javascript)
- [Can i write typescript with in \<Script\> tag?](https://stackoverflow.com/questions/56106649/can-i-write-typescript-with-in-script-tag)
- [Discord discussion about `useState`](https://discord.com/channels/102860784329052160/103696749012467712/1142056424826994698):

  The simplest way to think about `useState` (imo) is to think of it as a function that stores your state and gives you back a copy of that state, and a way to update it.

  The `useState` function also checks if this is the first time it has been run. If it is, it returns an array with the default value and the setter, if not it returns the current state it holds (NB: not the state your component already has) and the setter.

  Basically don't treat `xIsNext` as anything but a representation of your state. Don't mutate it, and don't base any future values on it. This is one of the reasons why you want to use the function argument to the setter rather than just passing your representation of the state:

  ```javascript
  setXIsNext((actualState) => actualState + 2); // Actual state taken from the setter, which has a closure on the real state
  setXIsNext(xIsNext + 2) // Will work, but is incorrect in a few very rare cases, because xIsNext can be stale
  ```

  Very happy to be corrected because I am by no means experienced by react, quite the oppostie, but this mental model has worked for me well so far, even if it may not be entirely accurate.

  Will Sentance from codesmith is very good at explaining this. He usually has free seminars every week, but I can't see any on UIs (I reckon FEM may have something to do with that since he released a course).
- [... in JavaScript – the Three Dots Operator in JS](https://www.freecodecamp.org/news/three-dots-operator-in-javascript/)
- [HTML Button background-color property does not work](https://stackoverflow.com/questions/41180844/html-button-background-color-property-does-not-work)

## VSCode config

```json
"editor.formatOnSave": true,
"[css]": {
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.tabSize": 2
},
"[html]": {
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.tabSize": 2
},
"[javascript]": {
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.tabSize": 2,
},
"[typescript]": {
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.tabSize": 2
},
// "emmet.triggerExpansionOnTab": true,
"emmet.includeLanguages": {
  "javascript": "javascriptreact",
  "typescript": "typescriptreact",
},
// JS
"javascript.inlayHints.enumMemberValues.enabled": true,
"javascript.inlayHints.functionLikeReturnTypes.enabled": true,
"javascript.inlayHints.parameterNames.enabled": "all",
"javascript.inlayHints.parameterNames.suppressWhenArgumentMatchesName": true,
"javascript.inlayHints.parameterTypes.enabled": true,
"javascript.inlayHints.propertyDeclarationTypes.enabled": true,
"javascript.inlayHints.variableTypes.enabled": true,
"javascript.inlayHints.variableTypes.suppressWhenTypeMatchesName": false,
// TS
"typescript.inlayHints.enumMemberValues.enabled": true,
"typescript.inlayHints.functionLikeReturnTypes.enabled": true,
"typescript.inlayHints.parameterNames.enabled": "all",
"typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName": true,
"typescript.inlayHints.parameterTypes.enabled": true,
"typescript.inlayHints.propertyDeclarationTypes.enabled": true,
"typescript.inlayHints.variableTypes.enabled": true,
"typescript.inlayHints.variableTypes.suppressWhenTypeMatchesName": false,
```

## `.eslintrc.json`

```json
"rules": {
  // maybe your other rules...
  "no-unused-vars": "warn",
  "react/prop-types": "warn"
}
```
