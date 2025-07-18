---
sitemap:
  lastmod: 2024-07-17 +0000
---

# CentOS 7

Last modified: 2024-07-17 +0000

- [Interesting posts](#interesting-posts)
- [yum](#yum)
  - [Manage repositories](#manage-repositories)
  - [List all the versions of a package](#list-all-the-versions-of-a-package)
  - [Install a specific version of a package](#install-a-specific-version-of-a-package)
  - [Remove a package and its dependencies](#remove-a-package-and-its-dependencies)
  - [Search for an installed package](#search-for-an-installed-package)
- [Node.js](#nodejs)

## Interesting posts

- [Could not resolve host: mirrorlist.centos.org – CloudLinux](https://cloudlinux.zendesk.com/hc/en-us/articles/14753974191516-Could-not-resolve-host-mirrorlist-centos-org):
  >
  > ```bash
  > sed -i.bak 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
  > sed -i.bak 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
  > ```
  >
- [Plesk or system updates fail on CentOS 7: Could not resolve host: mirrorlist.centos.org – Plesk](https://support.plesk.com/hc/en-us/articles/24575503258647-Plesk-or-system-updates-fail-on-CentOS-7-Could-not-resolve-host-mirrorlist-centos-org)
- [yum安装时提示：This system is not registered with an entitlement server. You can use subscription-manager to register. - Ajunyu - 博客园](https://www.cnblogs.com/ajunyu/p/13297449.html)

## yum

### Manage repositories

*References*:

- [How to add a Yum repository \| Enable Sysadmin](https://www.redhat.com/sysadmin/add-yum-repository)
- [centos - How do I remove a repository of yum - Server Fault](https://serverfault.com/questions/314461/how-do-i-remove-a-repository-of-yum)

### List all the versions of a package

Use `yum --showduplicates list PACKAGE_NAME`.

### Install a specific version of a package

Use `yum install PACKAGE_NAME-VERSION`.

### Remove a package and its dependencies

Use `yum autoremove PACKAGE_NAME`.

### Search for an installed package

Use `yum list installed | grep PACKAGE_NAME`.

## Node.js

- [nodesource/distributions: NodeSource Node.js Binary Distributions](https://github.com/nodesource/distributions)
