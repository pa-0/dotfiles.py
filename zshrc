# OH MY ZSH rc file
export EDITOR=nvim
# Used by termite to open links
export BROWSER=firefox
export TERM="xterm-256color"

# Variables
LOCAL_BIN=$HOME/.local/bin
LOCAL_SHARE=$HOME/.local/share
DOTFILES=$HOME/.dotfiles
ANTIGEN_HOME=$HOME/.antigen
DIRCOLORS=$HOME/.dir_colors
DIFFSOFANCY=$LOCAL_SHARE/diff-so-fancy
DIRCOLORSHOME=$LOCAL_SHARE/nord_dir_colors
HOME_MODULEPATH=$LOCAL_SHARE/Modules/modulefiles
TEXLIVE=/usr/local/texlive/2018
FZF_KEYBINDINGS=/usr/share/fzf/shell/key-bindings.zsh

# Env for vim
export VIMRC=$HOME/.config/nvim/init.vim
export VIMPLUGINS=$LOCAL_SHARE/nvim/plugins

# Local bin to PATH
[[ -d $LOCAL_BIN ]] && export PATH=$PATH:$LOCAL_BIN

# Antigen: Plugin Manager for Zsh
[[ -f $ANTIGEN_HOME/antigen.zsh ]] && source $ANTIGEN_HOME/antigen.zsh

# Load the oh my zsh library
antigen use oh-my-zsh
DISABLE_UPDATE_PROMPT="true"
CASE_SENSITIVE="true" # Use case-sensitive completion.
COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion.

antigen theme romkatv/powerlevel10k
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/romkatv/powerlevel10k
POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=' ..' 
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable virtualenv vcs background_jobs)

# Other plugins for ZSH
EXTERNAL_PLUGINS=(
    virtualenvwrapper
    zsh_reload
    hcgraf/zsh-sudo
    zdharma/fast-syntax-highlighting
    zsh-users/zsh-autosuggestions
)
for PLUGIN in $EXTERNAL_PLUGINS; do
    antigen bundle $PLUGIN
done
antigen apply # Done with antigen stuff

# Autosuggest strategy
ZSH_AUTOSUGGEST_STRATEGY=history

# Load custom functions and aliases
for FILE in $(ls $DOTFILES/zsh/*.zsh); do
    source $FILE
done

# Activate nord dir colors
test -r "$DIRCOLORS" && eval $(dircolors $DIRCOLORS)

# Activate shell keybindings
[[ -f $FZF_KEYBINDINGS ]] && source $FZF_KEYBINDINGS
export FZF_DEFAULT_OPTS='--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# History options
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

# ssh
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# TexLive distro
if [[ -d $TEXLIVE ]]; then
    export MANPATH=$MANPATH:$TEXLIVE/texmf-dist/doc/man
    export INFOPATH=$INFOPATH:$TEXLIVE/texmf-dist/doc/info
    export PATH=$PATH:$TEXLIVE/bin/x86_64-linux
fi

[[ -d $HOME_MODULEPATH ]] && export MODULEPATH=$MODULEPATH:$HOME_MODULEPATH

# Disable CTRL-s in the terminal
# check xon/xoff settings
if [ -t 0 ]; then # term test?
    # Turn off TTY "start" and "stop" commands in all interactive shells.
    # They default to C-q and C-s, Bash uses C-s to do a forward history search.
    stty start ''
    stty stop  ''
    stty -ixon # disable XON/XOFF flow control
    stty ixoff # enable sending (to app) of start/stop characters
    stty ixany # let any character restart output, not only start character
fi
