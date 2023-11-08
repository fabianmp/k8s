if [[ -z "$K8S_HOME" ]]; then
  K8S_HOME=$HOME/k8s
fi

unset_env() {
  if [[ -n "${K8S_ENV}" ]]; then
    export PATH="${PATH/${K8S_HOME}\/shims\/${K8S_ENV}:/}"
  fi
  unset K8S_ENV
  unset AWS_PROFILE
  unset KOPS_STATE_STORE
  unset KUBECONFIG
}

show_info() {
  if [[ -n "${K8S_ENV}" ]]; then
    echo "K8S_ENV=${K8S_ENV}"
    echo "K8S_SHIMS=${K8S_HOME}/shims/${K8S_ENV}"
  fi
  if [[ -n "${AWS_PROFILE}" ]]; then
    echo "AWS_PROFILE=${AWS_PROFILE}"
  fi
  if [[ -n "${KOPS_STATE_STORE}" ]]; then
    echo "KOPS_STATE_STORE=${KOPS_STATE_STORE}"
  fi
  if [[ -n "${KUBECONFIG}" ]]; then
    echo "KUBECONFIG=${KUBECONFIG}"
  fi
}

k8s() {
  if [[ $# != 1 ]]; then
    echo "Usage: $0 {list|info|unset|<name>}"
    return
  fi

  case "$1" in
    list)
      ls -1 ${K8S_HOME}
      ;;
    info)
      show_info
      ;;
    unset)
      unset_env
      ;;
    *)
      if [[ ! -f ${K8S_HOME}/$1 ]]; then
        echo "unknown cluster $1"
        return
      fi
      unset_env
      export K8S_ENV=${1}
      export PATH="${K8S_HOME}/shims/${K8S_ENV}:${PATH}"
      source ${K8S_HOME}/${1}
  esac
}
