# Launch kind

This playbook will walk you through the steps to launch a cluster using [kind](https://kind.sigs.k8s.io/).

Firstly, let's give a name to your kind cluster, and set it into $KIND_CLUSTER.
<!--shell
KIND_CLUSTER=kind
var::input-required "Please input the kind cluster name" KIND_CLUSTER
-->

Next, delete $KIND_CLUSTER if it's already been created:
```shell
kind delete cluster --name $KIND_CLUSTER
```

When use kind to launch the cluster, you can specify a configuration file as needed. Here is an example:
```shell
cat kind-config.yaml
```

To launch the cluster using the above configuraiton file:
```shell
kind create cluster --config kind-config.yaml --name=$KIND_CLUSTER
```