# Ctrl + space to accept the suggestion
bindkey '^ ' autosuggest-accept

# Allows accepting tab suggestions with <space>
zmodload zsh/complist
bindkey -M menuselect ' ' accept-search

# Edit line in vim with ctrl-e:
autoload edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey -s '^x^x' "clear ^o"

# neovim-like keybindings
zle -N fzf-open-file-in-editor
bindkey "${KEYBIND_PREFIX}f" fzf-open-file-in-editor

zle -N fzf-cd-to-dir
bindkey "${KEYBIND_PREFIX}c" fzf-cd-to-dir

# git keybindings
zle -N fzf-git-switch-branch
bindkey "${KEYBIND_PREFIX}gb" fzf-git-switch-branch

bindkey -s "${KEYBIND_PREFIX}gs" "gst ^o"
bindkey -s "${KEYBIND_PREFIX}ga" "ga ^o"
bindkey -s "${KEYBIND_PREFIX}gd" "gd ^o"
bindkey -s "${KEYBIND_PREFIX}gh" "gapa ^o"
bindkey -s "${KEYBIND_PREFIX}gc" "gc ^o"
bindkey -s "${KEYBIND_PREFIX}gr" "grbid ^o"
bindkey -s "${KEYBIND_PREFIX}gu" "gu ^o"
bindkey -s "${KEYBIND_PREFIX}gp" "gp ^o"
bindkey -s "${KEYBIND_PREFIX}gl" "gl ^o"
bindkey -s "${KEYBIND_PREFIX}gf" "git-feature "
