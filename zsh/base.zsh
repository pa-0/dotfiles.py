# Terminal stuff
alias sd='sudo '
alias sv='sudo nvim'
if $(which exa &> /dev/null); then
    alias ls='exa'
    alias ll='exa --icons --long --git'
    alias lt='exa --icons --tree'
    alias llrt='ll -s time'
else
    alias ls='ls --color=auto'
    alias ll='ls -lsF'
fi
alias less='less -r'
alias untar='tar xvfz'

alias hydra-ssh='ssh -CXY fjovell@hydra.uab.es -p 22'
alias calc='python3 -i -c "from math import *"'
alias rainbow='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'

# Development Aliases
alias p='ipython3'
alias v='nvim'

# Assign these file extensions to neovim
extensions=(py yaml yml cfg md rst txt json)
for ext in $extensions; do
    alias -s $ext=nvim
done

alias -s html=firefox

# Update plugins that live in the oh-my-zsh! folder
function upgrade_plugins () {
    env ZSH_CUSTOM=$ZSH_CUSTOM zsh $DOTFILES/update.sh
}

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip3
# pip zsh completion end
