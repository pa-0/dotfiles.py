# ZSH Keybindings

bindkey -d

zmodload zsh/complist
autoload edit-command-line

# FZF key-bindings for fedora
test -e /etc/fedora-release && source /usr/share/fzf/shell/key-bindings.zsh


WIDGETS=(
    edit-command-line
    fzf-cd-to-dir
    fzf-git-switch-branch
    fzf-open-file-in-editor
    open-db
    open-db-dir
    open-nvim-and-frecency
    open-nvim-and-live-grep
)

for widget ($WIDGETS) zle -N $widget

bindkey "${KEYBIND_PREFIX}b" fzf-git-switch-branch
bindkey "${KEYBIND_PREFIX}c" fzf-cd-to-dir
bindkey "${KEYBIND_PREFIX}f" fzf-open-file-in-editor
bindkey "${KEYBIND_PREFIX}s" open-nvim-and-live-grep
bindkey "${KEYBIND_PREFIX}m" open-nvim-and-frecency
bindkey '^ ' autosuggest-accept
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^N' down-history
bindkey '^O' accept-line
bindkey '^P' up-history
bindkey '^x^e' edit-command-line
bindkey '\\\\' open-db

bindkey -s "${KEYBIND_PREFIX}gf" "git-feature "
bindkey -s '^x^x' "clear ^o"
