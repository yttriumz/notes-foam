#!/bin/bash
# This script is dedicated for Ubuntu 22.04.
# Perform a system upgrade before running this script.
# MAKE SURE TO RUN THIS SCRIPT WITH `sudo bash kubernetes_installation.sh`.

# Set version.
CONTAINERD_VERSION=1.6.26-1
DOCKER_VERSION=5:24.0.0-1~ubuntu.22.04~jammy
DOCKER_BUILDX_VERSION=0.11.2-1~ubuntu.22.04~jammy
DOCKER_COMPOSE_VERSION=2.21.0-1~ubuntu.22.04~jammy
K8S_VERSION=v1.29
K8S_TOOL_VERSION=1.29.0-1.1

# Install containerd, which is bundled with docker.
# REF: https://github.com/containerd/containerd/blob/main/docs/getting-started.md
# REF: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
# Run the following command to uninstall all conflicting packages:
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do apt-get remove $pkg; done
# Add Docker's official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
# Add the repository to Apt sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y \
    containerd.io=${CONTAINERD_VERSION} \
    docker-ce=${DOCKER_VERSION} \
    docker-ce-cli=${DOCKER_VERSION} \
    docker-buildx-plugin=${DOCKER_BUILDX_VERSION} \
    docker-compose-plugin=${DOCKER_COMPOSE_VERSION}
apt-mark hold containerd.io docker-ce docker-ce-cli docker-buildx-plugin docker-compose-plugin

# Install kubernetes.
# REF: https://kubernetes.io/blog/2023/08/31/legacy-package-repository-deprecation/
# REF: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
curl -fsSL https://pkgs.k8s.io/core:/stable:/${K8S_VERSION}/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
chmod a+r /etc/apt/keyrings/kubernetes-apt-keyring.gpg
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/${K8S_VERSION}/deb/ /" | tee /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y \
    kubelet=${K8S_TOOL_VERSION} \
    kubeadm=${K8S_TOOL_VERSION} \
    kubectl=${K8S_TOOL_VERSION}
apt-mark hold kubelet kubeadm kubectl

# Disable swap
swapoff -a
sed -i '/swap/s/^/# /' /etc/fstab
echo "================================"
echo "Please verify the content of /etc/fstab"
echo "========== /etc/fstab =========="
echo "$(< /etc/fstab)"
