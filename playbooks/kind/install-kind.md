# Install Kind

This playbook will walk you through the steps to install [kind](https://kind.sigs.k8s.io/) on Linux OS.

Firstly, make sure kind hasn't been installed on your machine.
<!--shell
test-kind
-->

If it does not exist, then choose the kind version that you want to install, e.g. v0.11.1, latest, etc., and set into $KIND_VERSION.
<!--shell
KIND_VERSION=latest
var::input-required "Please input the kind version that you want to install" KIND_VERSION
-->

Then, download it to your local machine:
```shell
curl -Lo ./kind https://kind.sigs.k8s.io/dl/$KIND_VERSION/kind-linux-amd64
```

After download, make it executable, then choose a directory appeared in $PATH, e.g. `/usr/local/bin`, and move it there:
<!--shell
echo PATH=$PATH
KIND_PATH=/usr/local/bin
var::input-required "Please input the directory that you want to move to" KIND_PATH
-->
```shell
chmod +x ./kind
mv ./kind $KIND_PATH/kind
```

To verify:
```shell
kind version
```