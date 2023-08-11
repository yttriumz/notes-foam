# Git Usage Tips

- [Local configuration](#local-configuration)
  - [Show configs](#show-configs)
  - [Configure user](#configure-user)
  - [Automatic transformation (Windows)](#automatic-transformation-windows)
  - [Specify how to reconcile divergent branches](#specify-how-to-reconcile-divergent-branches)
- [GitHub configuration](#github-configuration)
  - [Add SSH key to GitHub](#add-ssh-key-to-github)
- [Commit message convention](#commit-message-convention)
- [Change commit messages](#change-commit-messages)
- [Clone to a specific directory](#clone-to-a-specific-directory)
- [Embedded repo](#embedded-repo)
- [Update an unchecked-out local branch from remote branch](#update-an-unchecked-out-local-branch-from-remote-branch)
- [Discard unstaged changes](#discard-unstaged-changes)
- [Stash changes](#stash-changes)
- [Rename branch](#rename-branch)
- [Change remote origin](#change-remote-origin)
- [Hard reset remote branch](#hard-reset-remote-branch)
- [Private fork](#private-fork)
- [墙国专属](#墙国专属)
  - [Change `hosts`](#change-hosts)
  - [Set proxy](#set-proxy)
    - [Linux](#linux)
  - [Other methods](#other-methods)
- [Interesting posts](#interesting-posts)

## Local configuration

### Show configs

Use `git config --list --show-origin --show-scope`.

### Configure user

Set the user name and email by the following commands:

```bash
git config --global user.name "YOUR_NAME"
git config --global user.email "YOUR_EMAIL"
```

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

## GitHub configuration

### Add SSH key to GitHub

1. Generate a key. See [[SSH#Generate SSH key]].
2. See [the GitHub guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

## Commit message convention

*References*:

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)

## Change commit messages

- Change the last one: `git commit --amend`
- [ ] Change multiple

*References*:

- [Changing a commit message](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/changing-a-commit-message)

## Clone to a specific directory

Use `git clone git@github.com:SOME_REPO TARGET_DIRECTORY`.

*References*:

- [How do I clone a Git repository into a specific folder?](https://stackoverflow.com/questions/651038/how-do-i-clone-a-git-repository-into-a-specific-folder)

## Embedded repo

*References*:

- [Git: How to make outer repository and embedded repository work as common/standalone repository?](https://stackoverflow.com/questions/47008290/git-how-to-make-outer-repository-and-embedded-repository-work-as-common-standal)

## Update an unchecked-out local branch from remote branch

Use `git fetch REMOTE_REPO REMOTE_BRANCH:LOCAL_BRANCH`.

*References*:

- [How to 'git pull' into a branch that is not the current one?](https://stackoverflow.com/questions/18994609/how-to-git-pull-into-a-branch-that-is-not-the-current-one)

## Discard unstaged changes

- Discard all: `git restore .`
- Discard a specific file: `git restore PATH_TO_THE_FILE`

*References*:

- [How To Completely Reset a Git Repository (Including Untracked Files)](https://www.howtogeek.com/devops/how-to-completely-reset-a-git-repository-including-untracked-files/)

## Stash changes

- Stash changes by `git stash`.
- Pop stash by `git stash pop`.

*References*:

- [Git stash](https://www.atlassian.com/git/tutorials/saving-changes/git-stash)

## Rename branch

- Rename checked-out local branch: Use `git branch --move NEW_BRANCH_NAME`.
- Rename unchecked-out local branch: Use `git branch --move BRANCH_NAME NEW_BRANCH_NAME`.

## Change remote origin

Use `git remote set-url REMOTE_NAME NEW_URL`.

*References*:

- [How To Change Git Remote Origin](https://devconnected.com/how-to-change-git-remote-origin/)

## Hard reset remote branch

After hard resetting the local repo, use `git push -f REMOTE_REPO BRANCH_NAME` to hard reset the remote repo.

## Private fork

1. Create a new repo (`PRI_REPO`) via the GitHub Website.
2. Duplicate the public repo (`PUB_REPO`) via the following commands:

   ```bash
   git clone --bare https://github.com/exampleuser/PUB_REPO.git
   cd PUB_REPO.git
   git push --mirror https://github.com/yourname/PRI_REPO.git
   cd ..
   rm -rf PUB_REPO.git
   ```

3. Clone the private repo and add `upstream` via the following commands:

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

## Interesting posts

- [git里面的文件怎么删不掉_彻底删除git中没用的大文件](https://blog.csdn.net/weixin_33335559/article/details/112012325)

[//begin]: # "Autogenerated link references for markdown compatibility"
[SSH#Generate SSH key]: remote/SSH.md "SSH Usage"
[//end]: # "Autogenerated link references"
