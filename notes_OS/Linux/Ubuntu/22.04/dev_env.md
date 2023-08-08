# Ubuntu 22.04 Development Environment

- [Basic environment](#basic-environment)
- [Single-master Kubernetes installation](#single-master-kubernetes-installation)
   - [System requirement](#system-requirement)
   - [All nodes](#all-nodes)
   - [Only on the control node](#only-on-the-control-node)
   - [Only on worker nodes](#only-on-worker-nodes)
   - [Troubleshooting](#troubleshooting)
- [Helm](#helm)
- [Redpanda](#redpanda)

## Basic environment

Install the basic environment by the following commands:

```bash
apt install build-essential curl git neovim
```

## Single-master Kubernetes installation

### System requirement

- KUBERNETES 1.26
- CONTAINERD 1.6.16
- Install some helper via the following commands:

  ```bash
  apt install apt-transport-https ca-certificates
  ```

### All nodes

1. Optionally add the following lines to `/etc/hosts`

   ```hosts
   192.168.75.232 k8sm1
   192.168.75.233 k8sm2
   192.168.75.234 k8sm3
   ```

2. Add the following to `/etc/modules-load.d/modules.conf`:

   ```conf
   overlay
   br_netfilter
   ```

   Then apply via the following commands:

   ```bash
   sudo modprobe overlay
   sudo modprobe br_netfilter
   ```

3. Modify `/etc/sysctl.d/99-sysctl.conf` to enable the following options:

   ```conf
   net.ipv4.ip_forward=1
   net.bridge.bridge-nf-call-iptables=1
   net.bridge.bridge-nf-call-ip6tables=1
   ```

   Then apply via the following commands:

   ```bash
   sudo sysctl --system
   ```

4. Install containerd via the following commands:

   ```bash
   sudo -s # Change to root
   wget https://github.com/containerd/containerd/releases/download/v1.6.16/containerd-1.6.16-linux-amd64.tar.gz -P /tmp/
   tar Cxzvf /usr/local /tmp/containerd-1.6.16-linux-amd64.tar.gz
   wget https://raw.githubusercontent.com/containerd/containerd/main/containerd.service -P /etc/systemd/system/ # TODO: May need a specific version
   systemctl daemon-reload
   systemctl enable --now containerd
   wget https://github.com/opencontainers/runc/releases/download/v1.1.4/runc.amd64 -P /tmp/
   install -m 755 /tmp/runc.amd64 /usr/local/sbin/runc
   wget https://github.com/containernetworking/plugins/releases/download/v1.2.0/cni-plugins-linux-amd64-v1.2.0.tgz -P /tmp/
   mkdir -p /opt/cni/bin
   tar Cxzvf /opt/cni/bin /tmp/cni-plugins-linux-amd64-v1.2.0.tgz
   mkdir -p /etc/containerd
   containerd config default | tee /etc/containerd/config.toml
   exit # Exit root
   ```

   Manually edit `/etc/containerd/config.toml` and change `systemdCgroup` to `true`:

   ```toml
   [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
     BinaryName = ""
     CriuImagePath = ""
     CriuPath = ""
     CriuWorkPath = ""
     IoGid = 0
     IoUid = 0
     NoNewKeyring = false
     NoPivotRoot = false
     Root = ""
     ShimCgroup = ""
     SystemdCgroup = true # <-- Edit here
   ```

   Then restart the service via `systemctl restart containerd`.

5. Turn off swap via `swapoff -a`. Also edit `/etc/fstab` to disable swap:

   ```fstab
   #/swap.img      none    swap    sw      0       0
   ```

6. Install Kubernetes via the following commands:

   ```bash
   sudo -s # Change to root
   touch /etc/apt/sources.list.d/kubernetes.list
   curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg
   echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
   apt update
   apt install kubelet=1.26.1-00 kubeadm=1.26.1-00 kubectl=1.26.1-00
   apt-mark hold kubelet kubeadm kubectl
   exit # Exit root
   ```

### Only on the control node

1. Install the control plane via the following commands:

   ```bash
   kubeadm init --v=5 --pod-network-cidr 10.10.0.0/16 --kubernetes-version 1.26.1 --node-name CONTROL_NODE_HOSTNAME
   ```

2. Start the cluster via the following commands **as a regular user**:

   ```bash
   mkdir -p $HOME/.kube
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   sudo chown $(id -u):$(id -g) $HOME/.kube/config
   ```

3. Add Calico 3.25 CNI via the following commands:

   ```bash
   mkdir ~/eWalker
   cd ~/eWalker
   curl -fSLO https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/tigera-operator.yaml
   kubectl create -f tigera-operator.yaml
   curl -fSLO https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/custom-resources.yaml
   ```

   Then edit the CIDR in `custom-resources.yaml` for pods if it's customized:

   ```yaml
   cidr: 10.10.0.0/16
   ```

   Then apply via the following commands:

   ```bash
   kubectl apply -f custom-resources.yaml
   ```

   *References*:

   - [Quickstart for Calico on Kubernetes](https://docs.tigera.io/calico/3.25/getting-started/kubernetes/quickstart)

4. Get worker node commands for joining additional nodes into the cluster via the following commands:

   ```bash
   kubeadm token create --print-join-command
   ```

### Only on worker nodes

Run the command from the `kubeadm token create` output above.

### Troubleshooting

- Node "NoteReady": `systemctl restart kubelet` solves the issue for me.

*References*:

- [Debugging your Kubernetes nodes in the ‘not ready’ state](https://www.airplane.dev/blog/debugging-kubernetes-nodes-in-not-ready-state)

## Helm

Install Helm via the following commands:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

*References*:

- [From Script](https://helm.sh/docs/intro/install/#from-script)

## Redpanda

Output:

```text
ewalker@ewalker-k8s-c1:~/eWalker$ helm install redpanda redpanda/redpanda \
  --namespace k8s-redpanda \
  --create-namespace \
  --set external.domain=${DOMAIN} \
  --set statefulset.initContainers.setDataDirOwnership.enabled=true
NAME: redpanda
LAST DEPLOYED: Tue Aug  8 13:30:16 2023
NAMESPACE: k8s-redpanda
STATUS: deployed
REVISION: 1
NOTES:
Congratulations on installing redpanda!

The pods will rollout in a few seconds. To check the status:

  kubectl -n k8s-redpanda rollout status statefulset redpanda --watch

Try some sample commands:

Get the api status:

  kubectl -n k8s-redpanda exec -ti redpanda-0 -c redpanda -- rpk cluster info --brokers redpanda-0.redpanda.k8s-redpanda.svc.cluster.local.:9093,redpanda-1.redpanda.k8s-redpanda.svc.cluster.local.:9093,redpanda-2.redpanda.k8s-redpanda.svc.cluster.local.:9093 --tls-enabled --tls-truststore /etc/tls/certs/default/ca.crt

Create a topic

  kubectl -n k8s-redpanda exec -ti redpanda-0 -c redpanda -- rpk topic create test-topic --brokers redpanda-0.redpanda.k8s-redpanda.svc.cluster.local.:9093,redpanda-1.redpanda.k8s-redpanda.svc.cluster.local.:9093,redpanda-2.redpanda.k8s-redpanda.svc.cluster.local.:9093 --tls-enabled --tls-truststore /etc/tls/certs/default/ca.crt

Describe the topic:

  kubectl -n k8s-redpanda exec -ti redpanda-0 -c redpanda -- rpk topic describe test-topic --brokers redpanda-0.redpanda.k8s-redpanda.svc.cluster.local.:9093,redpanda-1.redpanda.k8s-redpanda.svc.cluster.local.:9093,redpanda-2.redpanda.k8s-redpanda.svc.cluster.local.:9093 --tls-enabled --tls-truststore /etc/tls/certs/default/ca.crt

Delete the topic:

  kubectl -n k8s-redpanda exec -ti redpanda-0 -c redpanda -- rpk topic delete test-topic --brokers redpanda-0.redpanda.k8s-redpanda.svc.cluster.local.:9093,redpanda-1.redpanda.k8s-redpanda.svc.cluster.local.:9093,redpanda-2.redpanda.k8s-redpanda.svc.cluster.local.:9093 --tls-enabled --tls-truststore /etc/tls/certs/default/ca.crt
```
