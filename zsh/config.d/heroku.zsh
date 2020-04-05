if $(which heroku &> /dev/null); then
    # heroku autocomplete setup
    HEROKU_AC_ZSH_SETUP_PATH=/home/fjovell/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
fi
