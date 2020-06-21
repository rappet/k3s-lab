# Kubernetes Lab

Small k3s lab to test Kubernetes deployments

## Setup

Run with Vagrant:

```bash
vagrant up
```

Set up kubectl:

```bash
ln -s $(pwd)/k3s/k3s.yaml ~/.kube/config
```

Access kubernetes dashboard:

```bash
kubectl proxy
xdg-open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

Token is print during vagrant provisioning.