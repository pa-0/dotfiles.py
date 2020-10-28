# Completions for varied CLI programs

[[ "$(command -v kubectl)" ]] && source <(kubectl completion zsh)
[[ "$(command -v pipx)" ]] && eval "$(register-python-argcomplete pipx)"
