# Git Usage Tips

Last modified: 2023/11/21 11:53:36

- [Interesting posts](#interesting-posts)
- [Git configuration](#git-configuration)
  - [Show configs](#show-configs)
  - [Configure user](#configure-user)
  - [Automatic transformation (Windows)](#automatic-transformation-windows)
  - [Specify how to reconcile divergent branches](#specify-how-to-reconcile-divergent-branches)
  - [Add SSH key to GitHub](#add-ssh-key-to-github)
  - [Use non-default SSH keys for remote connection](#use-non-default-ssh-keys-for-remote-connection)
  - [Use different keys for different repositories](#use-different-keys-for-different-repositories)
- [Clone to a specific directory](#clone-to-a-specific-directory)
- [Clone all remote branches](#clone-all-remote-branches)
- [Commit message convention](#commit-message-convention)
- [Change commit messages](#change-commit-messages)
- [Stash changes](#stash-changes)
- [Discard unstaged changes](#discard-unstaged-changes)
- [Update an unchecked-out local branch from remote branch](#update-an-unchecked-out-local-branch-from-remote-branch)
- [Rename branch](#rename-branch)
- [Change remote origin](#change-remote-origin)
- [Push an existing repository to a new remote](#push-an-existing-repository-to-a-new-remote)
- [Hard reset remote branch](#hard-reset-remote-branch)
- [Private fork](#private-fork)
- [Embedded repositories](#embedded-repositories)
- [Submodule](#submodule)
- [墙国专属](#墙国专属)
  - [Change `hosts`](#change-hosts)
  - [Set proxy](#set-proxy)
    - [Linux](#linux)
  - [Other methods](#other-methods)

## Interesting posts

- [Flight rules for Git](https://github.com/k88hudson/git-flight-rules/tree/master)
- [git里面的文件怎么删不掉_彻底删除git中没用的大文件](https://blog.csdn.net/weixin_33335559/article/details/112012325)
- [Shell variable expansion in git config - Stack Overflow](https://stackoverflow.com/questions/11262010/shell-variable-expansion-in-git-config)

## Git configuration

### Show configs

Use `git config --list --show-origin --show-scope`.

### Configure user

- Set *local* (inside each repository) username and email via the following commands:

  ```bash
  git config user.name "YOUR_NAME"
  git config user.email "YOUR_EMAIL"
  ```

- Set *global* username and email via the following commands:

  ```bash
  git config --global user.name "YOUR_NAME"
  git config --global user.email "YOUR_EMAIL"
  ```

*References*:

- [Git: Set local user.name and user.email different for each repo](https://stackoverflow.com/questions/42167345/git-set-local-user-name-and-user-email-different-for-each-repo)

### Automatic transformation (Windows)

Use `git config --global core.autocrlf false` or edit the `gitconfig` file directly.

### Specify how to reconcile divergent branches

Use `git config --global pull.rebase false` to suppress the following warning:

```log
hint: You have divergent branches and need to specify how to reconcile them.
hint: You can do so by running one of the following commands sometime before
hint: your next pull:
hint:
hint:   git config pull.rebase false  # merge
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint:
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
fatal: Need to specify how to reconcile divergent branches.
```

*References*:

- [How can I deal with this Git warning? "Pulling without specifying how to reconcile divergent branches is discouraged"](https://stackoverflow.com/questions/62653114/how-can-i-deal-with-this-git-warning-pulling-without-specifying-how-to-reconci)
- ["You have divergent branches and need to specify how to reconcile them."](https://github.com/desktop/desktop/issues/14431#issuecomment-1106634672)

### Add SSH key to GitHub

1. (Optional) Create a new key pair. See [[SSH#Create SSH key pair]].
2. See [the GitHub guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

### Use non-default SSH keys for remote connection

*References*:

<!-- TODO: raise an issue about languagetool linter -->

- [Using a non-default key name (other than id_rsa)](https://stackoverflow.com/questions/41412964/using-a-non-default-key-name-other-than-id-rsa)
- [Working with non-default SSH key pair paths](https://gist.github.com/mynameiskreang/deb3fd3b41d7dda664ab0d3597710ef9)

### Use different keys for different repositories

*References*:

- [ssh - How to tell git which private key to use? - Super User](https://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use/1664624#1664624)

## Clone to a specific directory

Use `git clone git@github.com:SOME_REPO TARGET_DIRECTORY`.

*References*:

- [How do I clone a Git repository into a specific folder?](https://stackoverflow.com/questions/651038/how-do-i-clone-a-git-repository-into-a-specific-folder)

## Clone all remote branches

*References*:

- [git - How do I clone all remote branches? - Stack Overflow](https://stackoverflow.com/questions/67699/how-do-i-clone-all-remote-branches)

## Commit message convention

*References*:

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)

## Change commit messages

- Change the last one: `git commit --amend`
- Change multiple:
  1. Use `git rebase -i HEAD~n` to display a list of the last `n` commits in the default text editor.
  2. Replace `pick` with `reword` before each commit message needs to change.
  3. Save and close the commit list file.
  4. In each resulting commit file, type the new commit message, save the file, and close it.

*References*:

- [Changing a commit message](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/changing-a-commit-message)

## Stash changes

- Stash changes by `git stash`.
- Pop stash by `git stash pop`.

*References*:

- [Git stash](https://www.atlassian.com/git/tutorials/saving-changes/git-stash)

## Discard unstaged changes

- Discard all: `git restore .`
- Discard a specific file: `git restore PATH_TO_THE_FILE`

*References*:

- [How To Completely Reset a Git Repository (Including Untracked Files)](https://www.howtogeek.com/devops/how-to-completely-reset-a-git-repository-including-untracked-files/)

## Update an unchecked-out local branch from remote branch

Use `git fetch REMOTE_REPO REMOTE_BRANCH:LOCAL_BRANCH`.

*References*:

- [How to 'git pull' into a branch that is not the current one?](https://stackoverflow.com/questions/18994609/how-to-git-pull-into-a-branch-that-is-not-the-current-one)

## Rename branch

- Rename checked-out local branch: Use `git branch --move NEW_BRANCH_NAME`.
- Rename unchecked-out local branch: Use `git branch --move BRANCH_NAME NEW_BRANCH_NAME`.
- If remote branches also needs renaming, just push the renamed local branches and delete the old branches on remote.

## Change remote origin

Use `git remote set-url REMOTE_NAME NEW_REMOTE_REPO`.

*References*:

- [How To Change Git Remote Origin](https://devconnected.com/how-to-change-git-remote-origin/)

## Push an existing repository to a new remote

Use the following commands:

```bash
git remote rename origin old-origin
git remote add origin NEW_REMOTE_REPO
git push --set-upstream origin --all
git push --set-upstream origin --tags
```

## Hard reset remote branch

After hard resetting the local repository, use `git push -f REMOTE_REPO BRANCH_NAME` to hard reset the remote repository.

## Private fork

1. Create a new repository (`PRI_REPO`) via the GitHub Website.
2. Duplicate the public repository (`PUB_REPO`) via the following commands:

   ```bash
   git clone --bare https://github.com/exampleuser/PUB_REPO.git
   cd PUB_REPO.git
   git push --mirror https://github.com/yourname/PRI_REPO.git
   cd ..
   rm -rf PUB_REPO.git
   ```

3. Clone the private repository and add `upstream` via the following commands:

   ```bash
   git clone https://github.com/yourname/PRI_REPO.git
   cd PRI_REPO
   git remote add upstream https://github.com/exampleuser/PUB_REPO.git
   git remote set-url --push upstream DISABLE # Optional
   ```

   - Pull updates from `upstream` via the following commands:

     ```bash
     git pull upstream master # Creates a merge commit
     ```

   - Push to `PRI_REPO`:

     ```bash
     git push origin master
     ```

*References*:

- [GitHub: How to make a fork of public repository private?](https://stackoverflow.com/questions/10065526/github-how-to-make-a-fork-of-PUB_REPOsitory-private)
- [Create a private fork of a public repository](https://gist.github.com/0xjac/85097472043b697ab57ba1b1c7530274)
- [Duplicating a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/duplicating-a-repository)

## Embedded repositories

*References*:

- [Git: How to make outer repository and embedded repository work as common/standalone repository?](https://stackoverflow.com/questions/47008290/git-how-to-make-outer-repository-and-embedded-repository-work-as-common-standal)

## Submodule

*References*:

- [Git - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [Git submodule | Atlassian](https://www.atlassian.com/git/tutorials/git-submodule)

## 墙国专属

### Change `hosts`

Get `hosts` from the following sites:

- https://github.com/521xueweihan/GitHub520
- https://github.com/ineo6/hosts
  - https://ineo6.github.io/hosts/
- https://github.com/isevenluo/github-hosts

*References*:

- [修改 Hosts 解决 Github 访问失败马克](https://zhuanlan.zhihu.com/p/107334179)

### Set proxy

#### Linux

*References*:

- [Configure Git to use a proxy](https://gist.github.com/evantoli/f8c23a37eb3558ab8765)
- [Configure Git to use a proxy (https or SSH+GIT)](https://gist.github.com/ozbillwang/005bd1dfc597a2f3a00148834ad3e551)
- [Git设置代理服务器](https://blog.csdn.net/yanhanhui1/article/details/118769098)

### Other methods

*References*:

- https://github.com/dotnetcore/FastGithub

[//begin]: # "Autogenerated link references for markdown compatibility"
[SSH#Create SSH key pair]: remote/SSH.md "SSH Usage"
[//end]: # "Autogenerated link references"
