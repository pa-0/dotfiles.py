# ZSH Keybindings

bindkey -d

zmodload zsh/complist

# FZF key-bindings for fedora
test -e /etc/fedora-release && source /usr/share/fzf/shell/key-bindings.zsh


WIDGETS=(
    edit-command-line
    fzf-cd-to-dir
    fzf-git-switch-branch
    fzf-new-window-choose-dir
    fzf-open-file-from-contents
    fzf-open-file-in-editor
)

for widget ($WIDGETS) zle -N $widget

bindkey "^G^G" fzf-git-switch-branch
bindkey "^G^E" fzf-open-file-in-editor
bindkey "^G^O" fzf-cd-to-dir
bindkey "^G^P" fzf-new-window-choose-dir
bindkey "^G^S" fzf-open-file-from-contents

bindkey -s "^G^F" "git-feature "

bindkey '^ ' autosuggest-accept
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^N' down-history
bindkey '^O' accept-line
bindkey '^P' up-history
