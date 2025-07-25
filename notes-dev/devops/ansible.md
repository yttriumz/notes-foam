---
sitemap:
  lastmod: 2025-07-25 +0000
---

# Ansible

Last modified: 2025-07-25 +0000

- [Interesting posts](#interesting-posts)
- [Tags](#tags)
- [Privilege escalation (`--become` or `--user`)](#privilege-escalation---become-or---user)

## Interesting posts

- [Red Hat Ansible Automation Platform Life Cycle \| Red Hat Customer Portal](https://access.redhat.com/support/policy/updates/ansible-automation-platform)
- [ansible-community/awesome-ansible: Awesome Ansible List](https://github.com/ansible-community/awesome-ansible)
- [Shell Scripts to Ansible \| Ansible Collaborative](https://www.ansible.com/blog/shell-scripts-to-ansible/)
- [Replace scripts with Ansible: package installation - Gerard Braad's blog](http://gbraad.nl/blog/replace-scripts-with-ansible-package-installation.html)
- [Ansible versus BASH script : r/linuxadmin](https://www.reddit.com/r/linuxadmin/comments/emcuqm/ansible_versus_bash_script/)
- [Ansible vs chef vs puppet : r/devops](https://www.reddit.com/r/devops/comments/18fleds/ansible_vs_chef_vs_puppet/)
- [Ansible vs. Puppet vs. Chef \| Medium](https://ip-specialist.medium.com/ansible-vs-puppet-vs-chef-a5fbee6ff4a9)
- [Chef vs. Puppet vs. Ansible: a side-by-side comparison for 2024 \| Better Stack Community](https://betterstack.com/community/comparisons/chef-vs-puppet-vs-ansible/)

Tutorials:

- [Ansible Tutorial for Beginners: Playbook & Examples](https://spacelift.io/blog/ansible-tutorial)
- [Ansible Playbooks: Complete Guide with Examples](https://spacelift.io/blog/ansible-playbooks)
- [Medium parser - Ansible Boot Camp 1 — What is Ansible \| by Tony \| Geek Culture \| Medium](http://webcache.googleusercontent.com/search?q=cache:https://medium.com/geekculture/ansible-boot-camp-1-what-is-ansible-b80abff314ac&strip=0&vwsrc=1&referer=medium-parser)
- [Deep dive on Ansible VScode extension \| Ansible Collaborative](https://www.ansible.com/blog/deep-dive-on-ansible-vscode-extension/)

Techniques:

- [Best Practices — Ansible Documentation](https://docs.ansible.com/ansible/2.9/user_guide/playbooks_best_practices.html)
- [Conventions, tips, and pitfalls — Ansible Community Documentation](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_best_practices.html#general-guidelines-tips)
- [Ansible 101 - Standards - Ansible Junky](https://www.ansiblejunky.com/blog/ansible-101-standards/)
- [Ansible Naming Conventions \| Tech Chorus. The Song Of Bits And Bytes.](https://www.techchorus.net/posts/ansible-naming-conventions/)
- [Ansible Techniques I Wish I’d Known Earlier \| Hacker News](https://news.ycombinator.com/item?id=28327694)
- [Please explain usage of "item" in Ansible - Stack Overflow](https://stackoverflow.com/questions/46724196/please-explain-usage-of-item-in-ansible)
- [Comparing `loop` and `with_*` - Loops — Ansible Documentation](https://docs.ansible.com/ansible/2.9/user_guide/playbooks_loops.html#comparing-loop-and-with)
- [Listing All Ansible Variables for a Host or Group \| Baeldung on Linux](https://www.baeldung.com/linux/ansible-list-variables-host-group)

Miscellaneous:

- [VS Code Ansible extension that can find all variable references or go to variable definition? : r/ansible](https://www.reddit.com/r/ansible/comments/keel3k/vs_code_ansible_extension_that_can_find_all/)

## Tags

- [How to run only one role of an Ansible playbook? - Stack Overflow](https://stackoverflow.com/questions/47414988/how-to-run-only-one-role-of-an-ansible-playbook)
- [How to run only one task in ansible playbook? - Stack Overflow](https://stackoverflow.com/questions/23945201/how-to-run-only-one-task-in-ansible-playbook)

## Privilege escalation (`--become` or `--user`)

TL;DR:

- `--user` defines **who you log in as**. It's the username for the initial SSH connection.
- `--become` is a boolean flag that says **"escalate my privileges after I log in."** It's almost always used to become the `root` user.

`--user`:

- **Purpose**: Connection & Authentication.
- **Playbook keyword**: `remote_user`
- **What it does**: It specifies the username to use when Ansible initiates an SSH connection to a target host. If you don't provide it, Ansible will try to use the current username from the machine you are running the command on.
- **When to use**: When the login user is different from your current local user.
- **Example command**:

  ```bash
  ansible-playbook my_playbook.yml --user ubuntu
  ```

  This command tells Ansible to execute `ssh ubuntu@target-host...` to connect.

`--become`:

- **Purpose**: Privilege Escalation & Authorization.
- **Playbook keyword**: `become: true`
- **What it does**: It tells Ansible that for tasks requiring higher permissions, it should use a privilege escalation tool. By default, this tool is `sudo`. It does **not** change the login user.
- **When to use**: When tasks require root/administrator privileges to execute.
- **Example command**:

  ```bash
  ansible-playbook my_playbook.yml --become
  ```

  This command tells Ansible to run privileged tasks using `sudo`. For example, a task to install a package would be executed as `sudo apt install ...` on the remote machine.

Often case is that you are forbidden from logging in directly as `root`. You must log in as a regular user and then use `sudo` for administrative tasks. This is where you use both flags together:

```sh
ansible-playbook install_nginx.yml --user ubuntu --become --ask-become-pass
```

See also [[security/root]].

*References*:

- [ansible — Ansible Community Documentation](https://docs.ansible.com/ansible/latest/cli/ansible.html#cmdoption-ansible-u)
- [ansible.builtin.user module – Manage user accounts — Ansible Community Documentation](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html)
- [Understanding privilege escalation: become — Ansible Community Documentation](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_privilege_escalation.html)
- [Best practice for gaining elevating privilege? : r/ansible](https://www.reddit.com/r/ansible/comments/fl84fg/best_practice_for_gaining_elevating_privilege/)

[//begin]: # "Autogenerated link references for markdown compatibility"
[security/root]: ../../notes-os/linux/security/root.md "Root Privilege"
[//end]: # "Autogenerated link references"
