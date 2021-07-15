# Install and Set Up kubectl

This playbook will walk you through the steps to install and set up kubectl along with other convenience command line tools on Linux OS.

## Install kubectl

Firstly, make sure kubectl hasn't been installed on your machine.
<!--shell
test-kubectl
-->

If it does not exist, then choose the kubectl version that you want to install, e.g. v1.18.17, and set into $KUBECTL_VERSION.
<!--shell
KUBECTL_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
var::input-required "Please input the kubectl version that you want to install" KUBECTL_VERSION
-->

Then, download it to your local machine:
```shell
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl"
```

After download, make it executable, then choose a directory appeared in $PATH, e.g. `/usr/local/bin`, and move it there:
<!--shell
echo PATH=$PATH
KUBECTL_PATH=/usr/local/bin
var::input-required "Please input the directory that you want to move to" KUBECTL_PATH
-->
```shell
chmod +x ./kubectl
mv ./kubectl $KUBECTL_PATH/kubectl
```

To verify:
```shell
kubectl version --client
```

## Install other utils

### kubealias

Download kubealias to your local machine and save it in your $HOME directory:
```shell
curl -L "https://raw.githubusercontent.com/ahmetb/kubectl-alias/master/.kubectl_aliases" -o $HOME/.kubectl_aliases
```

Then make sure which shell you use, e.g. bash or zsh, and put the corresponding rc filename to $SHELLRC_FILE.
<!--shell
SHELLRC_FILE=.bashrc
var::input-required "Please input the rc file of your shell" SHELLRC_FILE
-->


Then edit your shell rc file to add below line:
```shell
(cat ~/$SHELLRC_FILE | grep -q "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases") || echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" > ~/$SHELLRC_FILE
```