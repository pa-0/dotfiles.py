# Aliases
alias sudo='sudo ' # Use sudo with aliases
alias please='sudo'
alias prettyplease='sudo !!'
alias less='less -r'
alias untar='tar xvfz'
alias cl='clear'
alias copy='xsel -i --clipboard' # Meant to use it as a pipe
alias cd-='cd -'
alias e="\$EDITOR --noplugins"
alias v="\$EDITOR"
alias vim="\$EDITOR"

alias mv='mv -v'
alias rm='rm -v'
alias cp='cp -v'
alias mkdir='mkdir -pv'

# Replace ls for exa
if [ "$(command -v exa)" ]; then
    alias ls='exa'
    alias ll='exa --icons --long --git'
    alias lt='exa --icons --tree --git-ignore'
    alias lr='exa --icons --long --git --sort time'
else
    alias ls='ls --color=auto'
    alias ll='ls -lsF'
fi

# Replace cat for bat
[ "$(command -v bat)" ] && alias cat='bat'

# Aliases for dnf
if [ "$(command -v dnf)" ]; then
    alias dnfl='dnf list'
    alias dnfli='dnf list installed'
    alias dnfp='dnf info'
    alias dnfs='dnf search'
    alias dnfw='dnf whatprovides'

    alias dnfu='sudo dnf update'
    alias dnfy='sudo dnf update -y'
    alias dnfi='sudo dnf install'
    alias dnfyy='sudo dnf install -y'
    alias dnfr='sudo dnf remove'
fi

if [ "$(command -v ggrep)" ]; then
    alias grep='ggrep'
fi

if [ "$(command -v nitrogen)" ]; then
    alias wallpaper='nitrogen --restore'
fi

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../..'

alias -s html="\$BROWSER"
