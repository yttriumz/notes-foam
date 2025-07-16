---
sitemap:
  lastmod: 2025-07-10 +0000
---

# Babashka

Last modified: 2025-07-10 +0000

## Interesting posts

- [Babashka: Fast native Clojure scripting runtime \| Hacker News](https://news.ycombinator.com/item?id=39121392)
- [Is Clojure good for one off “dev task” sorts of scripting? : r/Clojure](https://www.reddit.com/r/Clojure/comments/1d31wx2/comment/l64rkw5/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
- [m3tti.github.io/borkweb-babashkas-first-webframework.md at master · m3tti/m3tti.github.io](https://github.com/m3tti/m3tti.github.io/blob/master/borkweb-babashkas-first-webframework.md)
- [When is Clojure "the right tool for the job"?](https://gist.github.com/didibus/6e5ff960b25fdc1a5f8f97acede614b0)
- [tty - How to run an interactive CLI program from within Clojure? - Stack Overflow](https://stackoverflow.com/questions/56541688/how-to-run-an-interactive-cli-program-from-within-clojure)
- [Upload files to SharePoint using Babashka · Jacob Emcken](https://www.emcken.dk/programming/2024/04/07/sharepoint-upload-file-with-app-only-principal-and-babashka/)

## Compare with Bash

- Bash:

  ```bash
  for node in {1..10}; do ssh -o 'StrictHostKeyChecking no' "ecs-ewalker-loadtest-$(printf %02d $node)" hostname && sleep 1; done
  ````

- Babashka:

  ```clojure
  (run! #(babashka.process/shell {:continue true} (format "ssh -o 'StrictHostKeyChecking no' ecs-ewalker-loadtest-%02d hostname && sleep 1" %)) (range 1 11))
  ```
