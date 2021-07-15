# Install Helm

This playbook will walk you through the steps to install [helm](https://helm.sh/) on your system.

Helm now has an installer script that will automatically grab the latest version of Helm and install it locally.
```shell
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
```

To verify the installation:
```shell
helm version
```