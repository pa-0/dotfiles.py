# Ctrl + space to accept the suggestion
bindkey '^ ' autosuggest-accept

# Allows accepting tab suggestions with <space>
zmodload zsh/complist
bindkey -M menuselect ' ' accept-search

# Edit line in vim with ctrl-e:
autoload edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
