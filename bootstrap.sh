#!/usr/bin/env bash

echo INSTALL K3S
curl -sfL https://get.k3s.io | sh -

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
cd /etc/rancher/k3s

# Install Kubernetes Dashboard
GITHUB_URL=https://github.com/kubernetes/dashboard/releases
VERSION_KUBE_DASHBOARD=$(curl -w '%{url_effective}' -I -L -s -S ${GITHUB_URL}/latest -o /dev/null | sed -e 's|.*/||')
k3s kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/${VERSION_KUBE_DASHBOARD}/aio/deploy/recommended.yaml
k3s kubectl create -f dashboard.admin-user.yml -f dashboard.admin-user-role.yml

echo "====== Setup kubectl =========================="
echo "Setup kube config: ln -s $(pwd)/k3s/k3s.yaml ~/.kube/config"
echo "====== Kubernetes Dashboard Bearer Token ======"
k3s kubectl -n kubernetes-dashboard describe secret admin-user-token | grep ^token
echo "Run kubectl proxy and access http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
echo "==============================================="