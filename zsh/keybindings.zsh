# Ctrl + space to accept the suggestion
bindkey '^ ' autosuggest-accept

# Allows accepting tab suggestions with <space>
zmodload zsh/complist
bindkey -M menuselect ' ' accept-search
