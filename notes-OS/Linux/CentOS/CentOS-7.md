# CentOS 7

Last modified: 2024/02/26 UTC

- [yum](#yum)
  - [List all the versions of a package](#list-all-the-versions-of-a-package)
  - [Install a specific version of a package](#install-a-specific-version-of-a-package)
  - [Remove a package and its dependencies](#remove-a-package-and-its-dependencies)
  - [Search for an installed package](#search-for-an-installed-package)
- [Node.js](#nodejs)

## yum

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
