# ZSH Keybindings

bindkey -d

zmodload zsh/complist

# FZF key-bindings for fedora
test -e /etc/fedora-release && source /usr/share/fzf/shell/key-bindings.zsh


WIDGETS=(
    edit-command-line
    fzf-cd-to-dir
    fzf-git-switch-branch
    fzf-open-file-from-contents
    fzf-open-file-in-editor
)

for widget ($WIDGETS) zle -N $widget

bindkey "^g^b" fzf-git-switch-branch
bindkey "^g^o" fzf-cd-to-dir
bindkey "^g^e" fzf-open-file-in-editor
bindkey "^g^s" fzf-open-file-from-contents

bindkey -s "^g^f" "git-feature "
bindkey -s '^x^x' "clear ^o"

bindkey '^ ' autosuggest-accept
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^N' down-history
bindkey '^O' accept-line
bindkey '^P' up-history
