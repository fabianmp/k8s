if test -z "$K8S_HOME"
  set K8S_HOME $HOME/k8s
end

function unset_env
  if test -n $K8S_ENV
    export PATH=(string replace "$K8S_HOME/shims/$K8S_ENV:" "" "$PATH")
  end
  set -ge K8S_ENV
  set -ge AWS_PROFILE
  set -ge KOPS_STATE_STORE
  set -ge KUBECONFIG
end

function show_info
  if test -n $K8S_ENV
    echo "K8S_ENV=$K8S_ENV"
    echo "K8S_SHIMS=$K8S_HOME/shims/$K8S_ENV"
  end
  if test -n $AWS_PROFILE
    echo "AWS_PROFILE=$AWS_PROFILE"
  end
  if test -n $KOPS_STATE_STORE
    echo "KOPS_STATE_STORE=$KOPS_STATE_STORE"
  end
  if test -n $KUBECONFIG
    echo "KUBECONFIG=$KUBECONFIG"
  end
end

function k8s
  if test (count $argv) -ne 1
    echo "Usage: k8s {list|info|unset|<name>}"
    return
  end

  switch $argv[1]
    case list
      ls -1 {$K8S_HOME}
    case info
      show_info
    case unset
      unset_env
    case "*"
      if test ! -f {$K8S_HOME}/$argv[1]
        echo "unknown cluster $argv[1]"
        return
      end
      unset_env
      export K8S_ENV=$argv[1]
      export PATH="$K8S_HOME/shims/$K8S_ENV:$PATH"
      source $K8S_HOME/$argv[1]
  end
end
