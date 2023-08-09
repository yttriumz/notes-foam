# Ubuntu 22.04 Development Environment

- [Basic environment](#basic-environment)
- [Docker](#docker)
- [minikube](#minikube)
- [kubectl](#kubectl)
- [Helm](#helm)
- [Redpanda](#redpanda)
    - [`minikube` and `docker`](#minikube-and-docker)
        - [Start the cluster](#start-the-cluster)
        - [Install Redpanda using Helm](#install-redpanda-using-helm)
        - [Test streaming](#test-streaming)
    - [`kubeadm` and `containerd`](#kubeadm-and-containerd)
- [KVM](#kvm)
- [Single-master Kubernetes installation](#single-master-kubernetes-installation)
    - [System requirement](#system-requirement)
    - [All nodes](#all-nodes)
    - [Only on the control node](#only-on-the-control-node)
    - [Only on worker nodes](#only-on-worker-nodes)
    - [Troubleshooting](#troubleshooting)

## Basic environment

Install the basic environment via the following commands:

```bash
apt install build-essential cpu-checker curl git neovim
```

## Docker

1. Install Docker via the following commands:

   ```bash
   sudo install -m 0755 -d /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   sudo chmod a+r /etc/apt/keyrings/docker.gpg
   echo \
     "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
     "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt update
   apt-cache madison docker-ce | awk '{ print $3 }' # List available versions.
   VERSION_STRING=5:24.0.5-1~ubuntu.22.04~jammy # Set the desired version.
   sudo apt install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-buildx-plugin docker-compose-plugin
   ```

2. Verify Docker installation via the following commands:

   ```bash
   sudo docker run hello-world
   ```

3. Add user to the docker group:

   ```bash
   sudo usermod -aG docker $USER && newgrp docker
   ```

*References*:

- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

## minikube

Install minikube via the following commands:

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 # May use a specific version, e.g. v1.31.1.
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

*References*:

- [minikube start](https://minikube.sigs.k8s.io/docs/start/)

## kubectl

- Install kubectl from the repo via the following commands:

  ```bash
  curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
  echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  sudo apt update
  sudo apt install kubectl
  ```

- Or install manually:
  - [ ] todo

*References*:

- [Install and Set Up kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

## Helm

Install Helm via the following commands:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh # Root permission might be needed.
```

*References*:

- [From Script](https://helm.sh/docs/intro/install/#from-script)

## Redpanda

### `minikube` and `docker`

#### Start the cluster

- `minikube start --namespace redpanda-k8s --nodes 4`:

  <details>
  <summary>Output</summary>

  ```text
  dv@Redpanda-minikube:~$ minikube start --namespace redpanda-k8s --nodes 4
  \U0001f604  minikube v1.31.1 on Ubuntu 22.04 (kvm/amd64)
  \u2728  Automatically selected the docker driver
  \U0001f4cc  Using Docker driver with root privileges
  \U0001f44d  Starting control plane node minikube in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f4be  Downloading Kubernetes v1.27.3 preload ...
      > preloaded-images-k8s-v18-v1...:  393.19 MiB / 393.19 MiB  100.00% 10.47 M
      > gcr.io/k8s-minikube/kicbase...:  447.59 MiB / 447.62 MiB  99.99% 11.60 Mi
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f433  Preparing Kubernetes v1.27.3 on Docker 24.0.4 ...
      \u25aa Generating certificates and keys ...
      \u25aa Booting up control plane ...
      \u25aa Configuring RBAC rules ...
  \U0001f517  Configuring CNI (Container Networking Interface) ...
      \u25aa Using image gcr.io/k8s-minikube/storage-provisioner:v5
  \U0001f50e  Verifying Kubernetes components...
  \U0001f31f  Enabled addons: storage-provisioner, default-storageclass

  \U0001f44d  Starting worker node minikube-m02 in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f310  Found network options:
      \u25aa NO_PROXY=192.168.49.2
  \U0001f433  Preparing Kubernetes v1.27.3 on Docker 24.0.4 ...
      \u25aa env NO_PROXY=192.168.49.2
  \U0001f50e  Verifying Kubernetes components...

  \U0001f44d  Starting worker node minikube-m03 in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f310  Found network options:
      \u25aa NO_PROXY=192.168.49.2,192.168.49.3
  \U0001f433  Preparing Kubernetes v1.27.3 on Docker 24.0.4 ...
      \u25aa env NO_PROXY=192.168.49.2
      \u25aa env NO_PROXY=192.168.49.2,192.168.49.3
  \U0001f50e  Verifying Kubernetes components...

  \U0001f44d  Starting worker node minikube-m04 in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f310  Found network options:
      \u25aa NO_PROXY=192.168.49.2,192.168.49.3,192.168.49.4
  \U0001f433  Preparing Kubernetes v1.27.3 on Docker 24.0.4 ...
      \u25aa env NO_PROXY=192.168.49.2
      \u25aa env NO_PROXY=192.168.49.2,192.168.49.3
      \u25aa env NO_PROXY=192.168.49.2,192.168.49.3,192.168.49.4
  \U0001f50e  Verifying Kubernetes components...
  \U0001f4a1  kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
  \U0001f3c4  Done! kubectl is now configured to use "minikube" cluster and "redpanda-k8s" namespace by default
  ```

  </details>

- `minikube start --namespace redpanda-k8s --nodes 4 --container-runtime containerd`:

  <details>
  <summary>Output</summary>

  ```text
  dv@Redpanda-minikube:~$ minikube start --namespace redpanda-k8s --nodes 4 --container-runtime containerd
  \U0001f604  minikube v1.31.1 on Ubuntu 22.04 (kvm/amd64)
  \u2728  Automatically selected the docker driver
  \U0001f4cc  Using Docker driver with root privileges
  \U0001f44d  Starting control plane node minikube in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f4be  Downloading Kubernetes v1.27.3 preload ...
      > preloaded-images-k8s-v18-v1...:  416.44 MiB / 416.44 MiB  100.00% 19.42 M
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f4e6  Preparing Kubernetes v1.27.3 on containerd 1.6.21 ...
      \u25aa Generating certificates and keys ...
      \u25aa Booting up control plane ...
      \u25aa Configuring RBAC rules ...
  \U0001f517  Configuring CNI (Container Networking Interface) ...
      \u25aa Using image gcr.io/k8s-minikube/storage-provisioner:v5
  \U0001f50e  Verifying Kubernetes components...
  \U0001f31f  Enabled addons: storage-provisioner, default-storageclass

  \U0001f44d  Starting worker node minikube-m02 in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f310  Found network options:
      \u25aa NO_PROXY=192.168.49.2
  \U0001f4e6  Preparing Kubernetes v1.27.3 on containerd 1.6.21 ...
      \u25aa env NO_PROXY=192.168.49.2
  \U0001f50e  Verifying Kubernetes components...

  \U0001f44d  Starting worker node minikube-m03 in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f310  Found network options:
      \u25aa NO_PROXY=192.168.49.2,192.168.49.3
  \U0001f4e6  Preparing Kubernetes v1.27.3 on containerd 1.6.21 ...
      \u25aa env NO_PROXY=192.168.49.2
      \u25aa env NO_PROXY=192.168.49.2,192.168.49.3
  \U0001f50e  Verifying Kubernetes components...

  \U0001f44d  Starting worker node minikube-m04 in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f310  Found network options:
      \u25aa NO_PROXY=192.168.49.2,192.168.49.3,192.168.49.4
  \U0001f4e6  Preparing Kubernetes v1.27.3 on containerd 1.6.21 ...
      \u25aa env NO_PROXY=192.168.49.2
      \u25aa env NO_PROXY=192.168.49.2,192.168.49.3
      \u25aa env NO_PROXY=192.168.49.2,192.168.49.3,192.168.49.4
  \U0001f50e  Verifying Kubernetes components...
  \U0001f3c4  Done! kubectl is now configured to use "minikube" cluster and "redpanda-k8s" namespace by default
  ```

  </details>

- `minikube start --namespace redpanda-k8s --nodes 4 --container-runtime containerd --service-cluster-ip-range "10.10.0.0/16"`:

  <details>
  <summary>Output</summary>

  ```text
  dv@Redpanda-minikube:~$ minikube start --namespace redpanda-k8s --nodes 4 --container-runtime containerd --service-cluster-ip-range "10.10.0.0/16"
  \U0001f604  minikube v1.31.1 on Ubuntu 22.04 (kvm/amd64)
  \u2728  Automatically selected the docker driver
  \U0001f4cc  Using Docker driver with root privileges
  \U0001f44d  Starting control plane node minikube in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f4e6  Preparing Kubernetes v1.27.3 on containerd 1.6.21 ...
      \u25aa Generating certificates and keys ...
      \u25aa Booting up control plane ...
      \u25aa Configuring RBAC rules ...
  \U0001f517  Configuring CNI (Container Networking Interface) ...
      \u25aa Using image gcr.io/k8s-minikube/storage-provisioner:v5
  \U0001f50e  Verifying Kubernetes components...
  \U0001f31f  Enabled addons: storage-provisioner, default-storageclass

  \U0001f44d  Starting worker node minikube-m02 in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f310  Found network options:
      \u25aa NO_PROXY=192.168.49.2
  \U0001f4e6  Preparing Kubernetes v1.27.3 on containerd 1.6.21 ...
      \u25aa env NO_PROXY=192.168.49.2
  \U0001f50e  Verifying Kubernetes components...

  \U0001f44d  Starting worker node minikube-m03 in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f310  Found network options:
      \u25aa NO_PROXY=192.168.49.2,192.168.49.3
  \U0001f4e6  Preparing Kubernetes v1.27.3 on containerd 1.6.21 ...
      \u25aa env NO_PROXY=192.168.49.2
      \u25aa env NO_PROXY=192.168.49.2,192.168.49.3
  \U0001f50e  Verifying Kubernetes components...

  \U0001f44d  Starting worker node minikube-m04 in cluster minikube
  \U0001f69c  Pulling base image ...
  \U0001f525  Creating docker container (CPUs=2, Memory=2200MB) ...
  \U0001f310  Found network options:
      \u25aa NO_PROXY=192.168.49.2,192.168.49.3,192.168.49.4
  \U0001f4e6  Preparing Kubernetes v1.27.3 on containerd 1.6.21 ...
      \u25aa env NO_PROXY=192.168.49.2
      \u25aa env NO_PROXY=192.168.49.2,192.168.49.3
      \u25aa env NO_PROXY=192.168.49.2,192.168.49.3,192.168.49.4
  \U0001f50e  Verifying Kubernetes components...
  \U0001f3c4  Done! kubectl is now configured to use "minikube" cluster and "redpanda-k8s" namespace by default
  ```

  </details>

#### Install Redpanda using Helm

Use the following commands:

```bash
helm repo add redpanda https://charts.redpanda.com
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --set installCRDs=true --namespace cert-manager  --create-namespace
export DOMAIN=customredpandadomain.local
helm install redpanda redpanda/redpanda \
  --namespace redpanda-k8s \
  --create-namespace \
  --set external.domain=${DOMAIN} \
  --set statefulset.initContainers.setDataDirOwnership.enabled=true
```

<details>
<summary>Output</summary>

```text
NAME: redpanda
LAST DEPLOYED: Tue Aug  8 18:05:00 2023
NAMESPACE: redpanda-k8s
STATUS: deployed
REVISION: 1
NOTES:
Congratulations on installing redpanda!

The pods will rollout in a few seconds. To check the status:

  kubectl -n redpanda-k8s rollout status statefulset redpanda --watch

Try some sample commands:

Get the api status:

  kubectl -n redpanda-k8s exec -ti redpanda-0 -c redpanda -- rpk cluster info --brokers redpanda-0.redpanda.redpanda-k8s.svc.cluster.local.:9093,redpanda-1.redpanda.redpanda-k8s.svc.cluster.local.:9093,redpanda-2.redpanda.redpanda-k8s.svc.cluster.local.:9093 --tls-enabled --tls-truststore /etc/tls/certs/default/ca.crt

Create a topic

  kubectl -n redpanda-k8s exec -ti redpanda-0 -c redpanda -- rpk topic create test-topic --brokers redpanda-0.redpanda.redpanda-k8s.svc.cluster.local.:9093,redpanda-1.redpanda.redpanda-k8s.svc.cluster.local.:9093,redpanda-2.redpanda.redpanda-k8s.svc.cluster.local.:9093 --tls-enabled --tls-truststore /etc/tls/certs/default/ca.crt

Describe the topic:

  kubectl -n redpanda-k8s exec -ti redpanda-0 -c redpanda -- rpk topic describe test-topic --brokers redpanda-0.redpanda.redpanda-k8s.svc.cluster.local.:9093,redpanda-1.redpanda.redpanda-k8s.svc.cluster.local.:9093,redpanda-2.redpanda.redpanda-k8s.svc.cluster.local.:9093 --tls-enabled --tls-truststore /etc/tls/certs/default/ca.crt

Delete the topic:

  kubectl -n redpanda-k8s exec -ti redpanda-0 -c redpanda -- rpk topic delete test-topic --brokers redpanda-0.redpanda.redpanda-k8s.svc.cluster.local.:9093,redpanda-1.redpanda.redpanda-k8s.svc.cluster.local.:9093,redpanda-2.redpanda.redpanda-k8s.svc.cluster.local.:9093 --tls-enabled --tls-truststore /etc/tls/certs/default/ca.crt
```

</details>

#### Test streaming

1. Create alias via the following commands:

   ```bash
   alias rpk-topic="kubectl --namespace redpanda-k8s exec -i -t redpanda-0 -c redpanda -- rpk topic --brokers redpanda-0.redpanda.redpanda-k8s.svc.cluster.local.:9093,redpanda-1.redpanda.redpanda-k8s.svc.cluster.local.:9093,redpanda-2.redpanda.redpanda-k8s.svc.cluster.local.:9093 --tls-truststore /etc/tls/certs/default/ca.crt --tls-enabled"
   ```

   Note that when specifying the `--brokers` flag, you may need to change the broker names if you are using a different k8s namespace. E.g. if using `foobar-namespace` instead of `redpanda-k8s`, the broker names would be `redpanda-0.redpanda.foobar-namespace.svc.cluster.local` etc. More detailed information can be obtained via `kubectl cluster-info dump`.

### `kubeadm` and `containerd`

## KVM

*References*:

- [KVM/Installation](https://help.ubuntu.com/community/KVM/Installation)

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
