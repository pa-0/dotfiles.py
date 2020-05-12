# Terminal stuff

# Use sudo with aliases
alias sudo='sudo '

# Go To dotfiles location
alias dot='cd $DOTFILES'

if [ "$(command -v nvim)" ]
then
    alias e="nvim --noplugins"
    alias v="nvim"
    alias vim="nvim"
fi

# Replace ls for exa
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

# Replace cat for bat
[ "$(command -v bat)" ] && alias cat='bat --theme base16'

alias less='less -r'
alias untar='tar xvfz'

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
