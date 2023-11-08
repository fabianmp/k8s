# k8s

Create a folder at `$HOME/k8s` and add a file for each environment.
These files will be sourced when the environment is activated, so they can contain commands and configurations similar to e.g. `.bashrc` files.
Usually you will only set e.g. `aws` or `kubectl` profiles using environment variables:

```sh
export AWS_PROFILE=default
export KUBECONFIG=$HOME/.kube/config
```
