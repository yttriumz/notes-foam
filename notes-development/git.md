---
sitemap:
  lastmod: 2024-12-03 +0000
---

# Git Usage

Last modified: 2024-12-03 +0000

- [Interesting posts](#interesting-posts)
- [Git configuration](#git-configuration)
  - [Show configs](#show-configs)
  - [Configure user](#configure-user)
  - [Automatic transformation (Windows)](#automatic-transformation-windows)
  - [Specify how to reconcile divergent branches](#specify-how-to-reconcile-divergent-branches)
  - [Use non-default SSH keys for remote connection](#use-non-default-ssh-keys-for-remote-connection)
  - [Use different keys for different repositories](#use-different-keys-for-different-repositories)
- [Clone to a specific directory](#clone-to-a-specific-directory)
- [Clone all remote branches](#clone-all-remote-branches)
- [Clone a specific tag only](#clone-a-specific-tag-only)
- [Clone a specific subdirectory](#clone-a-specific-subdirectory)
- [Commit message convention](#commit-message-convention)
- [Change commit messages](#change-commit-messages)
- [Check last commit](#check-last-commit)
- [Delete a commit but keep the changes](#delete-a-commit-but-keep-the-changes)
- [Delete tags](#delete-tags)
- [Stash changes](#stash-changes)
- [Discard non-staged changes](#discard-non-staged-changes)
- [Update an unchecked-out local branch from remote branch](#update-an-unchecked-out-local-branch-from-remote-branch)
- [Rename branch](#rename-branch)
- [Checkout remote branch](#checkout-remote-branch)
- [Change remote origin](#change-remote-origin)
- [Push to all remotes](#push-to-all-remotes)
- [Push an existing repository to a new remote](#push-an-existing-repository-to-a-new-remote)
- [Hard reset remote branch](#hard-reset-remote-branch)
- [Embedded repositories](#embedded-repositories)
- [Submodule](#submodule)
- [`vimdiff`](#vimdiff)

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

### Use non-default SSH keys for remote connection

*References*:

- [Using a non-default key name (other than id_rsa)](https://stackoverflow.com/questions/41412964/using-a-non-default-key-name-other-than-id-rsa)
- [Working with non-default SSH key pair paths](https://gist.github.com/mynameiskreang/deb3fd3b41d7dda664ab0d3597710ef9)

### Use different keys for different repositories

*References*:

- [ssh - How to tell git which private key to use? - Super User](https://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use/1664624#1664624)

## Clone to a specific directory

Use `git clone REMOTE_REPO TARGET_DIRECTORY`.

*References*:

- [How do I clone a Git repository into a specific folder?](https://stackoverflow.com/questions/651038/how-do-i-clone-a-git-repository-into-a-specific-folder)

## Clone all remote branches

*References*:

- [git - How do I clone all remote branches? - Stack Overflow](https://stackoverflow.com/questions/67699/how-do-i-clone-all-remote-branches)

## Clone a specific tag only

Use `git clone --depth 1 --branch TAG_NAME REMOTE_REPO`.

*References*:

- [How to clone a specific Git tag - Stack Overflow](https://stackoverflow.com/questions/20280726/how-to-clone-a-specific-git-tag)

## Clone a specific subdirectory

*References*:

- [How do I clone a subdirectory only of a Git repository? - Stack Overflow](https://stackoverflow.com/questions/600079/how-do-i-clone-a-subdirectory-only-of-a-git-repository/73254328#73254328)

## Commit message convention

*References*:

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [angular/CONTRIBUTING.md at main · angular/angular](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#-commit-message-format)

## Change commit messages

- Change the last one: `git commit --amend`
- Change multiple:
  1. Use `git rebase -i HEAD~n` to display a list of the last `n` commits in the default text editor.
  2. Replace `pick` with `reword` before each commit message needs to change.
  3. Save and close the commit list file.
  4. In each resulting commit file, type the new commit message, save the file, and close it.

*References*:

- [Changing a commit message](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/changing-a-commit-message)

## Check last commit

Use `git show --summary`.

*References*:

- [Git: See my last commit - Stack Overflow](https://stackoverflow.com/questions/2231546/git-see-my-last-commit)

## Delete a commit but keep the changes

- Use `git reset HEAD^` to reset head without modifying files.
- Use `git commit --amend` to add more changes to the latest commit.

*References*:

- [undo - Can I delete a git commit but keep the changes? - Stack Overflow](https://stackoverflow.com/questions/15772134/can-i-delete-a-git-commit-but-keep-the-changes)

## Delete tags

- Delete a local tag: `git tag -d TAG_NAME`
- Delete a remote tag: `git push --delete REMOTE_REPO TAG_NAME`

*References*:

- [git - How can I delete a remote tag? - Stack Overflow](https://stackoverflow.com/questions/5480258/how-can-i-delete-a-remote-tag)

## Stash changes

- Stash changes by `git stash`.
- Pop stash by `git stash pop`.

*References*:

- [Git stash](https://www.atlassian.com/git/tutorials/saving-changes/git-stash)

## Discard non-staged changes

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
- If remote branches also need renaming, push the renamed local branches and delete the old branches on remote.

## Checkout remote branch

- Before `2.23`: `git checkout -b BRANCH_NAME REMOTE_NAME/BRANCH_NAME`
- After `2.23`:
  - Only one remote: `git switch BRANCH_NAME`
  - Multiple remotes: `git switch -c BRANCH_NAME REMOTE_NAME/BRANCH_NAME`

*References*:

- [git checkout - How do I check out a remote Git branch? - Stack Overflow](https://stackoverflow.com/questions/1783405/how-do-i-check-out-a-remote-git-branch)

## Change remote origin

Use `git remote set-url REMOTE_NAME NEW_REMOTE_REPO`.

*References*:

- [How To Change Git Remote Origin](https://devconnected.com/how-to-change-git-remote-origin/)

## Push to all remotes

Make a git alias `push-to-all` via the following commands:

```bash
git config --global alias.push-to-all '!git remote | xargs -L1 git push --all'
```

*References*:

- [Able to push to all git remotes with the one command? - Stack Overflow](https://stackoverflow.com/questions/5785549/able-to-push-to-all-git-remotes-with-the-one-command)

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

## Embedded repositories

*References*:

- [Git: How to make outer repository and embedded repository work as common/standalone repository?](https://stackoverflow.com/questions/47008290/git-how-to-make-outer-repository-and-embedded-repository-work-as-common-standal)

## Submodule

*References*:

- [Git - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [Git submodule \| Atlassian](https://www.atlassian.com/git/tutorials/git-submodule)
- [How to change the remote repository for a git submodule? - Stack Overflow](https://stackoverflow.com/questions/913701/how-to-change-the-remote-repository-for-a-git-submodule)

## `vimdiff`

*References*:

- [Using Vimdiff. : r/vim](https://www.reddit.com/r/vim/comments/199bkgk/using_vimdiff/)
