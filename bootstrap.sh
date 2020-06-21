#!/usr/bin/env bash

echo INSTALL K3S
curl -sfL https://get.k3s.io | sh -

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
