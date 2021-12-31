# Completions for varied CLI programs

if [[ "$(command -v pipx)" ]]; then
    eval "$(register-python-argcomplete pipx)"
fi

if [[ "$(command -v heroku)" ]]; then
    # heroku autocomplete setup
    HEROKU_AC_ZSH_SETUP_PATH=/home/fjm/.cache/heroku/autocomplete/zsh_setup &&
        test -f $HEROKU_AC_ZSH_SETUP_PATH &&
        source $HEROKU_AC_ZSH_SETUP_PATH
fi
