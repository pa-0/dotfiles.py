# Completions for varied CLI programs

autoload -Uz compinit
compinit

# Completion Menu like OMZ
zstyle ':completion:*' menu-select

if [[ "$(command -v pipx)" ]]; then
    autoload -U bashcompinit
    bashcompinit
    eval "$(register-python-argcomplete pipx)"
fi

if [[ "$(command -v heroku)" ]]; then
    # heroku autocomplete setup
    HEROKU_AC_ZSH_SETUP_PATH=/home/fjm/.cache/heroku/autocomplete/zsh_setup &&
        test -f $HEROKU_AC_ZSH_SETUP_PATH &&
        source $HEROKU_AC_ZSH_SETUP_PATH
fi
