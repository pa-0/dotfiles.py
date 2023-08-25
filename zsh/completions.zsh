# Completions for varied CLI programs

autoload -Uz compinit
compinit

# Completion Menu like OMZ
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true

if [[ "$(command -v kubectl)" ]]; then
    source <(kubectl completion zsh)
fi

if [[ "$(command -v helm)" ]]; then
    source <(helm completion zsh)
fi
