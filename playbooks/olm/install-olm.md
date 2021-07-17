# Install OLM

This playbook will walk you through the steps to install OLM into a Kubernetes cluster.

Choose the OLM version that you want to install, e.g. v0.18.2, and set into $OLM_VERSION.
<!--shell
var::input-required "Please input the OLM version that you want to install" OLM_VERSION
var::store OLM_VERSION
-->
Then, run the install script as below:
```shell
curl -L https://github.com/operator-framework/operator-lifecycle-manager/releases/download/$OLM_VERSION/install.sh | sed 's/set -e//g' | bash -s $OLM_VERSION
```