# k8s

Simple context manager for multiple cloud environments.

## Usage

Source the file for your shell during startup, e.g. [k8s.bash](./k8s.bash) in your `$HOME/.bashrc`.

Create a folder at `$HOME/k8s` and add a file for each environment.
These files will be sourced when the environment is activated, so they can contain commands and configurations similar to e.g. `.bashrc` files.
Usually you will only set e.g. `aws` or `kubectl` profiles using environment variables:

```sh
export AWS_PROFILE=my-profile
export KUBECONFIG=$HOME/.kube/my-profile
```

## Add kubectl config

Create a new config file for `kubectl`, e.g. at `$HOME/.kube/my-profile`:

```yaml
apiVersion: v1
clusters: null
contexts: null
current-context: ""
kind: Config
preferences: {}
users: null
```

You can export your current context easily using `kubectl config view --raw --minify`.

## Add AWS profiles

In `$HOME/.aws/config` add a new profile:

```ini
[profile my-profile]
output = yaml
region = eu-central-1
```

In `$HOME/.aws/credentials` add credentials to be used by that profile:

```ini
[my-profile]
aws_access_key_id = ACCESS_KEY_ID
aws_secret_access_key = SECRET_ACCESS_KEY
```
