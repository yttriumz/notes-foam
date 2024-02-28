# Kubernetes Usage

Last modified: 2024/02/23 UTC

- [Interesting posts](#interesting-posts)
  - [Tutorials](#tutorials)
- [Management tool](#management-tool)
- [Check cluster status](#check-cluster-status)
- [Remove nodes](#remove-nodes)
- [Remove pods](#remove-pods)
- [Debug pods](#debug-pods)
- [Get a shell to a running container](#get-a-shell-to-a-running-container)
- [Get files inside pods](#get-files-inside-pods)
- [Helm](#helm)

## Interesting posts

- [Demystifying Container Orchestration: A Beginner's Guide \| SUSE Communities](https://www.suse.com/c/rancher_blog/demystifying-container-orchestration-a-beginners-guide/)
- [Why is learning Kubernetes so intimidating? : devops](https://www.reddit.com/r/devops/comments/o7w9yn/why_is_learning_kubernetes_so_intimidating/)
- [Why Is Kubernetes So Hard - 4 Reasons Why And What to do About it — Release](https://release.com/blog/why-kubernetes-is-so-hard)
- [How Kubernetes And Kafka Will Get You Fired \| by Jan Kammerath - Freedium](https://freedium.cfd/https://medium.com/@jankammerath/how-kubernetes-and-kafka-will-get-you-fired-a6dccbd36c77)
- [Kafka on Kubernetes: What could go wrong?](https://redpanda.com/blog/kafka-kubernetes-deployment-pros-cons):
  > Kubernetes connects the container runtime interface (CRI) with the container network interface (CNI) and the container storage interface (CSI), and then it provides the plumbing and glue to turn one or more containers into an application.
- [Error installing from official repos onto Ubuntu · Issue #3219 · kubernetes/release](https://github.com/kubernetes/release/issues/3219)
- [Demo Systems Infrastructure - Kubernetes \| GitLab](https://about.gitlab.com/handbook/customer-success/demo-systems/infrastructure/kubernetes/)
- [Kubernetes networking model - IBM Documentation](https://www.ibm.com/docs/en/cloud-private/3.2.x?topic=networking-kubernetes-network-model)
- [CIDR Update in Kubernetes](https://kubeops.net/blog/cidr-update-in-kubernetes)
- [Why disable swap on kubernetes - Server Fault](https://serverfault.com/questions/881517/why-disable-swap-on-kubernetes)
- [Why Kubernetes Hates Linux Swap?. A typical computer system has two types… \| by Bhargav Bhikkaji \| Tailwinds-MajorDomo \| Medium](https://medium.com/tailwinds-navigator/kubernetes-tip-why-disable-swap-on-linux-3505f0250263)
- [deployments do not support (honor) container restartPolicy · Issue #24725 · kubernetes/kubernetes](https://github.com/kubernetes/kubernetes/issues/24725)

### Tutorials

- [Learn Kubernetes and Containers \| Rancher](https://www.rancher.com/learn-the-basics)
- [mmumshad/kubernetes-the-hard-way: Bootstrap Kubernetes the hard way on Vagrant on Local Machine. No scripts.](https://github.com/mmumshad/kubernetes-the-hard-way)
- [How to Deploy Kubernetes with Kubeadm and containerd - The New Stack](https://thenewstack.io/how-to-deploy-kubernetes-with-kubeadm-and-containerd/)
- [How to Install a Multi-Node Kubernetes Cluster on Ubuntu](https://www.atlantic.net/dedicated-server-hosting/how-to-set-up-three-node-kubernetes-cluster-on-ubuntu/)

## Management tool

*References*:

- [Kubernetes technologies: Kubeadm vs MiniKube, Kind and K3S](https://www.padok.fr/en/blog/minikube-kubeadm-kind-k3s)

## Check cluster status

*References*:

- [My worker node status is Ready,SchedulingDisabled](https://stackoverflow.com/questions/55432764/my-worker-node-status-is-ready-schedulingdisabled)
- [How to List All Pods and Its Nodes in Kubernetes \| Baeldung on Ops](https://www.baeldung.com/ops/kubernetes-list-every-pod-node)
- [componentstatuses doesn't work when Scheduler and Controller Manager are running on secure port · Issue #93342 · kubernetes/kubernetes](https://github.com/kubernetes/kubernetes/issues/93342)
  - [kubernetes/CHANGELOG/CHANGELOG-1.19.md at master · kubernetes/kubernetes](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.19.md#deprecation):
    > Kube-apiserver: the componentstatus API is deprecated. This API provided status of etcd, kube-scheduler, and kube-controller-manager components, but only worked when those components were local to the API server, and when kube-scheduler and kube-controller-manager exposed unsecured health endpoints. Instead of this API, etcd health is included in the kube-apiserver health check and kube-scheduler/kube-controller-manager health checks can be made directly against those components' health endpoints.
- [List All Resources in a Namespace in Kubernetes \| Baeldung on Ops](https://www.baeldung.com/ops/kubernetes-list-all-resources)

## Remove nodes

*References*:

- [How to gracefully remove a node from Kubernetes?](https://stackoverflow.com/questions/35757620/how-to-gracefully-remove-a-node-from-kubernetes)

## Remove pods

*References*:

- [Remove Daemonset pod from a node](https://stackoverflow.com/questions/48078196/remove-daemonset-pod-from-a-node)

## Debug pods

*References*:

- [Monitoring, Logging, and Debugging \| Kubernetes](https://kubernetes.io/docs/tasks/debug/)
- [Debug Init Containers \| Kubernetes](https://kubernetes.io/docs/tasks/debug/debug-application/debug-init-containers/)
- [Kubectl Reference Docs](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)
- [Kubernetes troubleshooting: 6 ways to find and fix issues \| Enable Sysadmin](https://www.redhat.com/sysadmin/kubernetes-troubleshooting)

## Get a shell to a running container

Use the following commands:

```bash
kubectl exec -it POD_NAME -- bash
# full form
kubectl exec --stdin --tty POD_NAME --container CONTAINER_NAME -- /bin/bash
```

*References*:

- [Get a Shell to a Running Container \| Kubernetes](https://kubernetes.io/docs/tasks/debug/debug-application/get-shell-running-container/)

## Get files inside pods

```bash
# Copy /tmp/foo_dir local directory to /tmp/bar_dir in a remote pod in the default namespace
kubectl cp /tmp/foo_dir SOME_POD:/tmp/bar_dir

# Copy /tmp/foo local file to /tmp/bar in a remote pod in a specific container
kubectl cp /tmp/foo SOME_POD:/tmp/bar -c SPECIFIC_CONTAINER

# Copy /tmp/foo local file to /tmp/bar in a remote pod in namespace <some-namespace>
kubectl cp /tmp/foo SOME_NAMESPACE/SOME_POD:/tmp/bar

# Copy /tmp/bar from a remote pod to /tmp/foo locally
kubectl cp SOME_NAMESPACE/SOME_POD:/tmp/bar /tmp/foo
```

*References*:

- [azure aks - How to copy files from kubernetes Pods to local system - Stack Overflow](https://stackoverflow.com/questions/52407277/how-to-copy-files-from-kubernetes-pods-to-local-system)

## Helm

*References*:

- [kubernetes - UPGRADE FAILED: another operation (install/upgrade/rollback) is in progress - Stack Overflow](https://stackoverflow.com/questions/71599858/upgrade-failed-another-operation-install-upgrade-rollback-is-in-progress)
