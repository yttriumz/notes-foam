---
sitemap:
  lastmod: 2025-07-08 +0000
---

# Babashka

Last modified: 2025-07-08 +0000

## Interesting posts

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
