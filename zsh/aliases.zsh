# Aliases
alias sudo='sudo ' # Use sudo with aliases
alias please='sudo'
alias prettyplease='sudo !!'
alias less='less -r'
alias untar='tar xvfz'
alias cl='clear'
alias copy='xsel -i --clipboard' # Meant to use it as a pipe

# Go To dotfiles location
alias dot='cd $DOTFILES'
alias dev='cd $DEV'

# Make it easy to call nvim
if [ "$(command -v nvim)" ]
then
    alias e="$EDITOR --noplugins"
    alias v="$EDITOR"
    alias vim="$EDITOR"
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
[ "$(command -v bat)" ] && alias cat='bat --theme nord'

# Aliases for dnf
if [ $(command -v dnf) ]
then
    alias dnfl='dnf list'
    alias dnfli='dnf list installed'
    alias dnfp='dnf info'
    alias dnfs='dnf search'

    alias dnfu='sudo dnf update'
    alias dnfy='sudo dnf update -y'
    alias dnfi='sudo dnf install'
    alias dnfyy='sudo dnf install -y'
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

alias wallpaper='feh --bg-fill $DOTFILES/wallpaper/wallpaper.png'

alias -s html=firefox
