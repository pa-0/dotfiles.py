# Terminal stuff
EDITOR="nvim"
PAGER="less -RF"
BROWSER="firefox"

export EDITOR PAGER BROWSER

alias f="$BROWSER"
alias e="$EDITOR"
alias v="$EDITOR"
alias vim="$EDITOR"
if [ "$(command -v slack)" ]
then
    alias s='slack'
fi

alias sd='sudo '
alias sv='sudo nvim'

if [ "$(command -v exa)" ]
then
    alias ls='exa'
    alias ll='exa --icons --long --git'
    alias lt='exa --icons --tree --git-ignore'
    alias lr='exa --icons --long --git --sort time'
else
    alias ls='ls --color=auto'
    alias ll='ls -lsF'
fi
if [ "$(command -v bat)" ]
then
    alias cat='bat --theme base16'
fi
alias less='less -r'
alias untar='tar xvfz'

alias dot='cd ${DOTFILES:-$HOME/.dotfiles}'

# Aliases for dnf
if [ $(command -v dnf) ]
then
    alias dnfl='dnf list'
    alias dnfli='dnf list installed'
    alias dnfp='dnf info'
    alias dnfs='dnf search'

    alias dnfu='sudo dnf update'
    alias dnfi='sudo dnf install'
    alias dnfr='sudo dnf remove'
fi

# Alias docker commands
if [ "$(command -v docker)" ]
then
    docker () {
        if [[ $@ == "ps" ]]; then
            command docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}\t{{.Networks}}\t{{.Ports}}"
        elif [[ $@ == "stop all" ]]; then
            command docker stop $(docker ps -q)
        else
            command docker "$@"
        fi
    }
fi

alias wallpaper='feh --bg-scale $DOTFILES/wallpaper/wallpaper.jpg'

alias -s html=firefox
