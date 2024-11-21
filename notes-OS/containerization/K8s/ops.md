---
sitemap:
  lastmod: 2024-11-19 +0000
---

# Kubernetes Operations and Troubleshooting

Last modified: 2024-11-19 +0000

- [Interesting posts](#interesting-posts)
- [`kubectl`](#kubectl)
- [`kuztomize`](#kuztomize)
- [Cluster status](#cluster-status)
- [Node label](#node-label)
- [Remove nodes](#remove-nodes)
- [Debug pods](#debug-pods)
- [Remove pods](#remove-pods)
- [Get shells to running pods](#get-shells-to-running-pods)
- [Get files inside pods](#get-files-inside-pods)
- [Security configuration](#security-configuration)
- [etcd](#etcd)
- [Helm](#helm)
    - [Troubleshooting releases](#troubleshooting-releases)
- [Deployment](#deployment)

## Interesting posts

- [What tool suggestions do you have for someone who's gonna set up an on-premise k8 cluster? Which tools do you use? : r/kubernetes](https://www.reddit.com/r/kubernetes/comments/12zg3am/what_tool_suggestions_do_you_have_for_someone/)
- [IPVS no destination available \| Kubernetes 排障指南](https://imroc.cc/kubernetes-troubleshooting/methods/node/ipvs-no-destination-available)
- [IPVS: rr: TCP 10.254.159.251:9004 - no destination available · Issue #415 · cloudnativelabs/kube-router](https://github.com/cloudnativelabs/kube-router/issues/415#issuecomment-386045811)

## `kubectl`

*References*:

- [Kubectl Cheatsheet \| Free Cheatsheet](https://www.bluematador.com/learn/kubectl-cheatsheet)
- [Command line tool (kubectl) \| Kubernetes](https://kubernetes.io/docs/reference/kubectl/)
- [kubectl Usage Conventions \| Kubernetes](https://kubernetes.io/docs/reference/kubectl/conventions/)
- [Kubectl Reference Docs](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)

## `kuztomize`

*References*:

- Official site: [Kustomize - Kubernetes native configuration management](https://kustomize.io/)
- Official guide: [Kustomize \| SIG CLI](https://kubectl.docs.kubernetes.io/guides/introduction/kustomize/)
- Official reference: [Kustomize \| SIG CLI](https://kubectl.docs.kubernetes.io/references/kustomize/)
- [kubectl kustomize \| Kubernetes](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_kustomize/)
- [Declarative Management of Kubernetes Objects Using Kustomize \| Kubernetes](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/)
- [Managing Secrets using Kustomize \| Kubernetes](https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-kustomize/)
- [Configure Kubernetes with Kustomize  \|  Config Sync  \|  Google Cloud](https://cloud.google.com/kubernetes-engine/enterprise/config-sync/docs/concepts/kustomize)
- [A Quick Introduction to Kustomize \| by Neron Joseph \| Medium](https://neron-joseph.medium.com/a-quick-introduction-to-kustomize-172a6512beaf)

## Cluster status

*References*:

- [My worker node status is Ready,SchedulingDisabled](https://stackoverflow.com/questions/55432764/my-worker-node-status-is-ready-schedulingdisabled)
- [How to List All Pods and Its Nodes in Kubernetes \| Baeldung on Ops](https://www.baeldung.com/ops/kubernetes-list-every-pod-node)
- [componentstatuses doesn't work when Scheduler and Controller Manager are running on secure port · Issue #93342 · kubernetes/kubernetes](https://github.com/kubernetes/kubernetes/issues/93342)
  - [kubernetes/CHANGELOG/CHANGELOG-1.19.md at master · kubernetes/kubernetes](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.19.md#deprecation):
    > Kube-apiserver: the componentstatus API is deprecated. This API provided status of etcd, kube-scheduler, and kube-controller-manager components, but only worked when those components were local to the API server, and when kube-scheduler and kube-controller-manager exposed unsecured health endpoints. Instead of this API, etcd health is included in the kube-apiserver health check and kube-scheduler/kube-controller-manager health checks can be made directly against those components' health endpoints.
- [List All Resources in a Namespace in Kubernetes \| Baeldung on Ops](https://www.baeldung.com/ops/kubernetes-list-all-resources)
- [kubectl - How do you find the cluster & service CIDR of a Kubernetes cluster? - Stack Overflow](https://stackoverflow.com/questions/44190607/how-do-you-find-the-cluster-service-cidr-of-a-kubernetes-cluster)

## Node label

*References*:

- [How to Label Kubernetes Nodes (and Remove it Later)](https://linuxhandbook.com/kubectl-label-node/)

## Remove nodes

*References*:

- [How to gracefully remove a node from Kubernetes?](https://stackoverflow.com/questions/35757620/how-to-gracefully-remove-a-node-from-kubernetes)

## Debug pods

*References*:

- [Monitoring, Logging, and Debugging \| Kubernetes](https://kubernetes.io/docs/tasks/debug/)
- [Debug Init Containers \| Kubernetes](https://kubernetes.io/docs/tasks/debug/debug-application/debug-init-containers/)
- [Kubectl Reference Docs](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)
- [Kubernetes troubleshooting: 6 ways to find and fix issues \| Enable Sysadmin](https://www.redhat.com/sysadmin/kubernetes-troubleshooting)
- [How to Debug Kubernetes Pending Pods and Scheduling Failures \| Datadog](https://www.datadoghq.com/blog/debug-kubernetes-pending-pods/)
- [docker - K8s cannot schedule new pods to worker nodes even though there are enough resources - Stack Overflow](https://stackoverflow.com/questions/71733396/k8s-cannot-schedule-new-pods-to-worker-nodes-even-though-there-are-enough-resour)

## Remove pods

*References*:

- [Force Delete StatefulSet Pods \| Kubernetes](https://kubernetes.io/docs/tasks/run-application/force-delete-stateful-set-pod/)
- [Remove Daemonset pod from a node](https://stackoverflow.com/questions/48078196/remove-daemonset-pod-from-a-node)

## Get shells to running pods

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

## Security configuration

*References*:

- [Restrict a Container's Access to Resources with AppArmor \| Kubernetes](https://kubernetes.io/docs/tutorials/security/apparmor/)
- [Linux kernel security constraints for Pods and containers \| Kubernetes](https://kubernetes.io/docs/concepts/security/linux-kernel-security-constraints/#apparmor)
- [Configure a Security Context for a Pod or Container \| Kubernetes](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)

## etcd

*References*:

- [rpc error: code = DeadlineExceeded desc = context deadline exceeded · Issue #12234 · etcd-io/etcd](https://github.com/etcd-io/etcd/issues/12234)

## Helm

*References*:

- [Helm \| Built-in Objects](https://helm.sh/docs/chart_template_guide/builtin_objects/)
- [Helm \| Helm Dependency](https://helm.sh/docs/helm/helm_dependency/)
- All about “Helm”- The Package Manager for Kubernetes:
  - [All about Helm- The Package Manager for Kubernetes Part 1 - BuildPiper](https://www.buildpiper.io/blogs/all-about-helm-the-package-manager-for-kubernetes-part-1/)
  - [All about Helm- The Package Manager for Kubernetes Part 2 - BuildPiper](https://www.buildpiper.io/blogs/all-about-helm-the-package-manager-for-kubernetes-part-2/)
- [kubernetes - UPGRADE FAILED: another operation (install/upgrade/rollback) is in progress - Stack Overflow](https://stackoverflow.com/questions/71599858/upgrade-failed-another-operation-install-upgrade-rollback-is-in-progress)
- [Helm 'delete' doesn't delete PVCs · Issue #5156 · helm/helm](https://github.com/helm/helm/issues/5156)
- [Helm delete all releases - Stack Overflow](https://stackoverflow.com/questions/47817818/helm-delete-all-releases)

### Troubleshooting releases

- `helm get manifest RELEASE`
- `helm install --debug --dry-run RELEASE ./CHART`

## Deployment

```bash
# Install on Ubuntu 22.04 using apt
K8S_VERSION="v1.29"
K8S_TOOL_VERSION="1.29.2-1.1"
curl -fsSL https://pkgs.k8s.io/core:/stable:/$K8S_VERSION/deb/Release.key |
    gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg >/dev/null
chmod a+r /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/$K8S_VERSION/deb/ /" |
    tee /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get --yes install \
    kubelet=$K8S_TOOL_VERSION \
    kubeadm=$K8S_TOOL_VERSION \
    kubectl=$K8S_TOOL_VERSION
apt-mark hold \
    kubelet \
    kubeadm \
    kubectl

# Using official binaries
K8S_VERSION="1.28.6"
ETCD_VERSION="3.5.10"
INSTALL_DIR="/usr/local/bin"
CURL_COMMON_OPTIONS=(
    --fail
    --location
    --show-error
    --silent
)
TAR_COMMON_OPTIONS=(
    --extract
    --gzip
    --overwrite
    --verbose

    --file -
    --directory "$INSTALL_DIR"
)
curl "${CURL_COMMON_OPTIONS[@]}" https://dl.k8s.io/v$K8S_VERSION/kubernetes-node-linux-amd64.tar.gz |
    tar "${TAR_COMMON_OPTIONS[@]}" --strip-components=3 --wildcards 'kubernetes/node/bin/*'
curl "${CURL_COMMON_OPTIONS[@]}" https://github.com/etcd-io/etcd/releases/download/v$ETCD_VERSION/etcd-v$ETCD_VERSION-linux-amd64.tar.gz |
    tar "${TAR_COMMON_OPTIONS[@]}" --strip-components=1 --wildcards 'etcd-v*/etcd*'
```

```bash
# Install on Ubuntu 22.04 using apt
HELM_VERSION="3.14.2-1"
curl https://baltocdn.com/helm/signing.asc |
    gpg --dearmor |
    tee /usr/share/keyrings/helm.gpg >/dev/null
chmod a+r /usr/share/keyrings/helm.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" |
    tee /etc/apt/sources.list.d/helm-stable-debian.list
apt-get update
apt-get --yes install helm=$HELM_VERSION
apt-mark hold helm

# Using official binaries
HELM_VERSION="3.13.1"
curl "${CURL_COMMON_OPTIONS[@]}" https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz |
    tar "${TAR_COMMON_OPTIONS[@]}" --strip-components 1 --wildcards 'linux-amd64/helm'
```
