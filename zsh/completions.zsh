# Completions for varied CLI programs

# TODO: Find what fixes this problem :(
if [[ "$(command -v kubectl)" ]]
then
    source <(kubectl completion zsh)
fi

if [[ "$(command -v pipx)" ]]
then
    eval "$(register-python-argcomplete pipx)"
fi

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/home/fjm/.cache/heroku/autocomplete/zsh_setup && \
    test -f $HEROKU_AC_ZSH_SETUP_PATH && \
    source $HEROKU_AC_ZSH_SETUP_PATH;
