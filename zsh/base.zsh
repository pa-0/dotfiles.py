# Zsh config
alias zshconfig="$EDITOR ~/.zshrc"

# Terminal stuff
alias sd='sudo '
alias sv='sudo nvim'
alias ls='ls --color=auto'
alias ll='ls -lsF'
alias hydra-ssh='ssh -CXY fjovell@hydra.uab.es -p 22'
alias calc='python -i -c "from math import *"'
alias rainbow='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'

# Development Aliases
alias v='nvim'
alias p='ipython'

function upgrade_plugins () {
    env ZSH_CUSTOM=$ZSH_CUSTOM zsh $DOTFILES/update.sh
}
