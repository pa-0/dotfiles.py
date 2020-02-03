# Terminal stuff
alias sd='sudo '
alias sv='sudo nvim'
if $(which exa &> /dev/null); then
    alias ls='exa'
    alias ll='exa --icons --long --git'
    alias lt='exa --icons --tree --git-ignore'
    alias lr='exa --icons --long --git --sort time'
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
alias v='nvim'
alias vim='nvim'
alias edit='nvim'

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
