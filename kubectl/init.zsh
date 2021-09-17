# Kubectl config

export KUBECONFIG="$HOME/.config/kube/config"
export KREW_ROOT="$HOME/.local/share/krew"

# TODO: Find what fixes this problem :(
if [[ "$(command -v kubectl)" ]]; then
	source <(kubectl completion zsh)
fi
