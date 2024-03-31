# ZSH Keybindings

bindkey -d

zmodload zsh/complist

# FZF key-bindings for fedora
test -e /etc/fedora-release && source /usr/share/fzf/shell/key-bindings.zsh

WIDGETS=(
    edit-command-line
    fzf-cd-to-dir
    fzf-new-window-choose-dir
    fzf-open-file-from-contents
    fzf-open-file-in-editor
)

# shellcheck disable=SC1073,SC1072,SC1058
for widget ($WIDGETS) zle -N $widget

bindkey "^G^E" fzf-open-file-in-editor
bindkey "^G^O" fzf-cd-to-dir
bindkey "^G^P" fzf-new-window-choose-dir
bindkey "^G^S" fzf-open-file-from-contents
bindkey "^G^Y" fzf-git-hashes-widget
bindkey "^G^U" fzf-git-branches-widget

bindkey '^ ' autosuggest-accept
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^N' down-history
bindkey '^O' accept-line
bindkey '^P' up-history
bindkey '^X^E' edit-command-line
