# Install and Setup Crossplane

This playbook will walk you through the steps to install Crossplane into a Kubernetes cluster.

## Install Crossplane

Firstly, create a namespace for Crossplane to install:
```shell
kubectl create namespace crossplane-system
```

Then, choose the Crossplane version that you want to install, e.g. 1.0.1, and set into $CROSSPLANE_VERSION.
<!--shell
CROSSPLANE_VERSION=1.3.0
var::input-required "Please input the Crossplane version that you want to install" CROSSPLANE_VERSION
-->

Then, use Helm 3 to install the official stable release of Crossplane which is suitable for community use and testing.
```shell
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
```

Before install, clean the previous release if there is any:
```shell
helm delete crossplane --namespace crossplane-system
kubectl patch lock lock -p '{"metadata":{"finalizers": []}}' --type=merge
kubectl get crd -o name | grep crossplane.io | xargs kubectl delete
```

Then, install the new release:
```shell
helm install crossplane --namespace crossplane-system crossplane-stable/crossplane --version $CROSSPLANE_VERSION
```

To verify the installation:
```shell
helm list -n crossplane-system
kubectl get all -n crossplane-system
```

## Install Crossplane CLI

The Crossplane CLI extends kubectl with functionality to build, push, and install Crossplane packages:
```shell
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
```

This will download the Crossplane CLI to your local machine, choose a directory appeared in $PATH, e.g. `/usr/local/bin`, and move it there:
<!--shell
echo PATH=$PATH
CROSSPLANE_CLI_PATH=/usr/local/bin
var::input-required "Please input the directory that you want to move to" CROSSPLANE_CLI_PATH
-->
```
mv kubectl-crossplane $CROSSPLANE_CLI_PATH
```