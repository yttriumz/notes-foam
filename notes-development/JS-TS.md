# JavaScript/TypeScript Development

Last modified: 2023/10/04 18:59:40

- [Interesting posts](#interesting-posts)
  - [Development environment](#development-environment)
  - [Development tools](#development-tools)
  - [Language features](#language-features)
  - [Coding style](#coding-style)
  - [React](#react)
    - [Elastic UI](#elastic-ui)
    - [i18n](#i18n)
- [Config](#config)
  - [VSCode `settings.json`](#vscode-settingsjson)
  - [VSCode `extensions.json`](#vscode-extensionsjson)
  - [`.eslintrc.json`](#eslintrcjson)

## Interesting posts

### Development environment

- [ReactJS - Environment Setup](https://www.tutorialspoint.com/reactjs/reactjs_environment_setup.htm)
- [ReactJS Environment Setup](https://www.geeksforgeeks.org/reactjs-environment-setup/)
- [Error message "error:0308010C:digital envelope routines::unsupported"](https://stackoverflow.com/questions/69692842/error-message-error0308010cdigital-envelope-routinesunsupported)
- [🧐[问题]项目无法启动，error:0308010C:digital envelope routines::unsupported #9272](https://github.com/ant-design/ant-design-pro/issues/9272#issuecomment-1083276843)
- [Cannot set headers after they are sent to the client #805](https://github.com/http-party/http-server/issues/805)

### Development tools

- [What is the difference between yarn run and npm start?](https://stackoverflow.com/questions/40619269/what-is-the-difference-between-yarn-run-and-npm-start)
- [npx | npm Docs](https://docs.npmjs.com/cli/v9/commands/npx?v=true)
- [npm-cache | npm Docs](https://docs.npmjs.com/cli/v9/commands/npm-cache?v=true)

### Language features

- [ECMAScript 6 compatibility table](https://kangax.github.io/compat-table/es6/)
- [HTML Button background-color property does not work](https://stackoverflow.com/questions/41180844/html-button-background-color-property-does-not-work)
- [JavaScript technologies overview](https://developer.mozilla.org/en-US/docs/Web/JavaScript/JavaScript_technologies_overview)
- [Strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE)
- [Immediately-Invoked Function Expression (IIFE)](https://benalman.com/news/2010/11/immediately-invoked-function-expression/)
- [Spread syntax (...)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)
- [... in JavaScript – the Three Dots Operator in JS](https://www.freecodecamp.org/news/three-dots-operator-in-javascript/)
- [Callback Functions in JavaScript](https://www.impressivewebs.com/callback-functions-javascript/)
- [As a JS Developer, ES6 Classes Are What Keep Me Up at Night](https://www.toptal.com/javascript/es6-class-chaos-keeps-js-developer-up)
- [Inheritance and the prototype chain](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)
- [Get loop counter/index using for…of syntax in JavaScript](https://stackoverflow.com/questions/10179815/get-loop-counter-index-using-for-of-syntax-in-javascript)
- [MDN note about `import`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules#importing_features_into_your_script):

  The imported values are read-only views of the features that were exported. Similar to `const` variables, you cannot re-assign the variable that was imported, but you can still modify properties of object values. The value can only be re-assigned by the module exporting it.
- [Can i write typescript with in \<Script\> tag?](https://stackoverflow.com/questions/56106649/can-i-write-typescript-with-in-script-tag)
- [Differences Between Type Aliases and Interfaces](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#differences-between-type-aliases-and-interfaces)
- [Interfaces vs Types in TypeScript](https://stackoverflow.com/questions/37233735/interfaces-vs-types-in-typescript/52682220#52682220)
- [Type vs Interface in TypeScript](https://blog.bitsrc.io/type-vs-interface-in-typescript-cf3c00bc04ae)
- [Learn and use Composition in JavaScript and TypeScript](https://softchris.github.io/pages/javascript-composition.html)
- [Don't use Enums in Typescript, they are very dangerous 😨](https://dev.to/ivanzm123/dont-use-enums-in-typescript-they-are-very-dangerous-57bh)
- [Nine terrible ways to use TypeScript enums, and one good way.](https://bluepnume.medium.com/nine-terrible-ways-to-use-typescript-enums-and-one-good-way-f9c7ec68bf15)
- [What does the `is` keyword do in typescript?](https://stackoverflow.com/questions/40081332/what-does-the-is-keyword-do-in-typescript)
- [What does the "as" keyword do?](https://stackoverflow.com/questions/55781559/what-does-the-as-keyword-do)
- [What does {} mean in TypeScript?](https://stackoverflow.com/questions/60381643/what-does-mean-in-typescript)

### Coding style

- [TypeScript codebase coding guidelines](https://github.com/Microsoft/TypeScript/wiki/Coding-guidelines)
- [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html)
- [TypeScript Naming Conventions: Crafting Maintainable Code](https://aykhanhuseyn.medium.com/typescript-naming-conventions-crafting-maintainable-code-7d872234fe17)
- [TypeScript Naming Convention](https://dev.to/shintoshio_me/typescript-naming-convention-2bbg)
- [Confused about the Interface and Class coding guidelines for TypeScript](https://stackoverflow.com/questions/31876947/confused-about-the-interface-and-class-coding-guidelines-for-typescript)
- [`Array<T>` Type](https://google.github.io/styleguide/tsguide.html#arrayt-type)

### React

- [Snack - React Native in the browser](https://snack.expo.dev/)
- [Getting Started | Create React App](https://create-react-app.dev/docs/getting-started)
- [TypeScript: Documentation - React](https://www.typescriptlang.org/docs/handbook/react.html)
- [microsoft/TypeScript-React-Starter: A starter template for TypeScript and React with a detailed README describing how to use the two together.](https://github.com/microsoft/TypeScript-React-Starter)
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
- [React hooks: not magic, just arrays](https://medium.com/@ryardley/react-hooks-not-magic-just-arrays-cd4f1857236e)
- [Blogged Answers: A (Mostly) Complete Guide to React Rendering Behavior](https://blog.isquaredsoftware.com/2020/05/blogged-answers-a-mostly-complete-guide-to-react-rendering-behavior/)
- [Timeline of a React Component With Hooks](https://julesblom.com/writing/react-hook-component-timeline)
- [How to Upgrade to React 18](https://react.dev/blog/2022/03/08/react-18-upgrade-guide#updates-to-client-rendering-apis)

#### Elastic UI

- [\[Meta\] Deprecation schedule #1469](https://github.com/elastic/eui/issues/1469)
- [Attempted import error: 'EuiPageContent' is not exported from '@elastic/eui' #6122](https://github.com/elastic/eui/issues/6122)
- [Cannot turn off "potentially unsafe when doing server-side rendering" noise #1105](https://github.com/emotion-js/emotion/issues/1105)
- [关于 Antd Table 报错 ”ResizeObserver loop completed with undelivered notifications“](https://juejin.cn/post/7262623363700981797)
- [Vite/Rollup cannot process the dynamic imports in `EuiIcon` #5463](https://github.com/elastic/eui/issues/5463)

#### i18n

- [React i18n: A step-by-step guide to React-intl](https://lokalise.com/blog/react-i18n-intl/)

## Config

### VSCode `settings.json`

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
"[javascriptreact]": {
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.tabSize": 2,
},
"[typescript]": {
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.tabSize": 2
},
"[typescriptreact]": {
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

### VSCode `extensions.json`

```json
"recommendations": [
    "mgmcdermott.vscode-language-babel",
    "ms-azuretools.vscode-docker",
    "dbaeumer.vscode-eslint",
    "github.vscode-github-actions",
    "github.vscode-pull-request-github",
    "visualstudioexptteam.vscodeintellicode",
    "idered.npm",
    "esbenp.prettier-vscode",
    "habeebarul.react-component-tree",
    "mtxr.sqltools",
    "nathhorrigan.code-svgr",
    "godrix.svgr-preview"
]
```

### `.eslintrc.json`

```json
"rules": {
  // maybe your other rules...
  "no-unused-vars": "warn",
  "react/prop-types": "warn",
  "@typescript-eslint/no-explicit-any": "warn",
  "@typescript-eslint/no-unused-vars": "warn",
}
```
