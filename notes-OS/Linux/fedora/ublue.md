---
sitemap:
  lastmod: 2025-03-25 +0000
---

# Universal Blue

Last modified: 2025-03-25 +0000

## Interesting posts

- [HowTo: change system configs without changing defaults - Fedora Discussion](https://discussion.fedoraproject.org/t/howto-change-system-configs-without-changing-defaults/143373)
- [Prepare for removal of rpm-ostree and gaps vs bootc - General - Universal Blue](https://universal-blue.discourse.group/t/prepare-for-removal-of-rpm-ostree-and-gaps-vs-bootc/7170)
- [Rpm-ostree list installed packages : r/Fedora](https://www.reddit.com/r/Fedora/comments/pvjyer/rpmostree_list_installed_packages/)
- [Silverblue/Kinoite users, what packages do you layer with rpm-ostree and why? : r/Fedora](https://www.reddit.com/r/Fedora/comments/t4rwzr/silverbluekinoite_users_what_packages_do_you/)

Concerning issues:

- [Remove usage of rpm-ostree · Issue #1946 · ublue-os/bluefin](https://github.com/ublue-os/bluefin/issues/1946)

## Grub2 and kernel parameters

- For editing kernel parameters, use `rpm-ostree kargs --editor`.
- For editing grub2 settings, edit `/boot/grub2/user.cfg` and then `ujust regenerate-grub`.

*References*:

- [/etc/default/grub is missing on Silverblue 41 fresh install - Fedora Discussion](https://discussion.fedoraproject.org/t/etc-default-grub-is-missing-on-silverblue-41-fresh-install/135344)

## Crypto policy

*References*:

- [Fedora 41: SSH to RHEL6 - error in libcrypto - Fedora Discussion](https://discussion.fedoraproject.org/t/fedora-41-ssh-to-rhel6-error-in-libcrypto/135999)
- [Changes/OpenSSLDistrustSHA1SigVer - Fedora Project Wiki](https://fedoraproject.org/wiki/Changes/OpenSSLDistrustSHA1SigVer)
