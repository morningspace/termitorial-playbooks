# Launch Kind

This playbook will walk you through the steps to launch a cluster using [kind](https://kind.sigs.k8s.io/).

When use kind to launch a cluster, you can specify a configuration file as needed. Here is an example:
```shell
cat kind-config.yaml
```

To laucn a kind cluster using the above configuraiton file:
```shell
kind create cluster --config kind-config.yaml
```
