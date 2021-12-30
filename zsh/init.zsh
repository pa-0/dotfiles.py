# local Variables
local LOCAL_SHARE="$HOME/.local/share"
local LOCAL_BIN="$HOME/.local/bin"

# Local bin to PATH
[[ -d $LOCAL_BIN ]] && path+="$LOCAL_BIN"
[[ -d $CARGO_HOME ]] && path+="$CARGO_HOME/bin"
[[ -d $GOPATH ]] && path+="$GOPATH/bin"

[[ "$(command -v kubectl)" ]] && [[ -d $KREW_ROOT ]] && path+="$LOCAL_SHARE/krew/bin"

# Completions with zfunc
[[ -d "$LOCAL_SHARE/zfunc/" ]] && fpath+="$LOCAL_SHARE/zfunc"
[[ -d "$HOME/.cache/zsh" ]] && fpath+="$HOME/.cache/zsh"

# Pyenv initialisation
[[ $(command -v pyenv) ]] && eval "$(pyenv init -)"

# Load custom aliases
[[ -f "$DOTFILES/zsh/aliases.zsh" ]] && source "$DOTFILES/zsh/aliases.zsh"
[[ -f "$DOTFILES/zsh/custom_functions.zsh" ]] && source "$DOTFILES/zsh/custom_functions.zsh"
[[ -f "$DOTFILES/zsh/config.zsh" ]] && source "$DOTFILES/zsh/config.zsh"
[[ -f "$DOTFILES/zsh/completions.zsh" ]] && source "$DOTFILES/zsh/completions.zsh"

# Load texlive
TEXLIVE_INSTALL=/usr/local/texlive/2021/
if [[ -d $TEXLIVE_INSTALL ]]; then
    TEXLIVE_BIN="$TEXLIVE_INSTALL/bin/x86_64-linux"
    [[ -d $TEXLIVE_BIN ]] && path+="$TEXLIVE_BIN"

    TEXLIVE_MAN="$TEXLIVE_INSTALL/texmf-dist/doc/man"
    [[ -d $TEXLIVE_MAN ]] && export MANPATH="$MANPATH:$TEXLIVE_MAN"

    TEXLIVE_INFO="$TEXLIVE_INSTALL/texmf-dist/doc/info"
    [[ -d $TEXLIVE_INFO ]] && export INFOPATH="$INFOPATH:$TEXLIVE_INFO"
fi

# Autosuggest strategy
ZSH_AUTOSUGGEST_STRATEGY='history'
ZSH_AUTOSUGGEST_USE_ASYNC='parallel'

[[ -f "$DOTFILES/zsh/keybindings.zsh" ]] && source $DOTFILES/zsh/keybindings.zsh

# Export Modulepath variable
local HOME_MODULEPATH="$DOTFILES/Modules/modulefiles"
[[ -d $HOME_MODULEPATH && ! $MODULEPATH =~ $HOME_MODULEPATH ]] &&
    export MODULEPATH="$MODULEPATH:$HOME_MODULEPATH"

[ "$(command -v module)" ] && module load git/latest python/latest

# Activate nord dir colors
local DIRCOLORS="$LOCAL_SHARE/nord_dir_colors/src/dir_colors"
test -r "$DIRCOLORS" && eval $(dircolors $DIRCOLORS)

# ssh
[[ -f "$HOME/.ssh/rsa_id" ]] && export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# Disable CTRL-s in the terminal
# check xon/xoff settings
if [ -t 0 ]; then # term test?
    # Turn off TTY "start" and "stop" commands in all interactive shells.
    # They default to C-q and C-s, Bash uses C-s to do a forward history search.
    stty start ''
    stty stop ''
    stty -ixon # disable XON/XOFF flow control
    stty ixoff # enable sending (to app) of start/stop characters
    stty ixany # let any character restart output, not only start character
fi

# vi: ft=zsh
