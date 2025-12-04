---
sitemap:
  lastmod: 2025-12-04 +0000
---

# Kubernetes Networking on Host

Last modified: 2025-12-04 +0000

## `etcd.service` cannot start

Likely blocked by `firewalld`.

```bash
# Temporary
firewall-cmd --zone=public --add-port=2379/tcp
firewall-cmd --zone=public --add-port=2380/tcp
# Permanent
firewall-cmd --permanent --add-port=2379/tcp
firewall-cmd --permanent --add-port=2380/tcp
firewall-cmd --reload
```

More ports according to Rancher:

```bash
# For etcd nodes, run the following commands:
firewall-cmd --permanent --add-port=2376/tcp
firewall-cmd --permanent --add-port=2379/tcp
firewall-cmd --permanent --add-port=2380/tcp
firewall-cmd --permanent --add-port=8472/udp
firewall-cmd --permanent --add-port=9099/tcp
firewall-cmd --permanent --add-port=10250/tcp

# For control plane nodes, run the following commands:
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=2376/tcp
firewall-cmd --permanent --add-port=6443/tcp
firewall-cmd --permanent --add-port=8472/udp
firewall-cmd --permanent --add-port=9099/tcp
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10254/tcp
firewall-cmd --permanent --add-port=30000-32767/tcp
firewall-cmd --permanent --add-port=30000-32767/udp

# For worker nodes, run the following commands:
firewall-cmd --permanent --add-port=22/tcp
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=2376/tcp
firewall-cmd --permanent --add-port=8472/udp
firewall-cmd --permanent --add-port=9099/tcp
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10254/tcp
firewall-cmd --permanent --add-port=30000-32767/tcp
firewall-cmd --permanent --add-port=30000-32767/udp
```

*References*:

- [etcd endpoint error when running kube-status on worker nodes](https://portal.microfocus.com/s/article/KM000025632?language=en_US)
- [Opening Ports with firewalld \| Rancher](https://ranchermanager.docs.rancher.com/how-to-guides/advanced-user-guides/open-ports-with-firewalld)
- [安装 etcd \| 文档 \| openEuler社区](https://docs.openeuler.org/zh/docs/24.03_LTS_SP2/cloud/cluster_deployment/kubernetes/installing_etcd.html)
