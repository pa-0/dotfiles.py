# ZSH Keybindings

bindkey -d

zmodload zsh/complist

# SHell key bindings for MacOS installed through brew
[[ "$(uname -a | ggrep -oi 'darwin')" ]] && source /usr/local/opt/fzf/shell/key-bindings.zsh

forgit-checkout-branch () {
    git forgit checkout_branch
}

WIDGETS=(
    edit-command-line
    forgit-checkout-branch
    fzf-cd-to-dir
    fzf-new-window-choose-dir
    fzf-open-file-from-contents
    fzf-open-file-in-editor
)

for widget ($WIDGETS) zle -N $widget

bindkey "^G^G" forgit-checkout-branch
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
