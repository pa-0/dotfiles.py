# VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenv
export PROJECT_HOME=$HOME/rp
export PIP_REQUIRE_VIRTUALENV=true
export VIRTUALENVWRAPPER_PYTHON=$(which python3.7)

[[ -f $(which virtualenvwrapper_lazy.sh) ]] && source $(which virtualenvwrapper_lazy.sh)

# TODO: Make a wrapper for virtualenvwrapper so that witha  single command I can do everything?
# Virtualenvwrapper stuff
alias gpip='PIP_REQUIRE_VIRTUALENV="" sudo python3 -m pip'

function activate () {
    if [[ -z $1 ]]; then
        WORKON_VIRTUALENV="${PWD##*/}"
    else
        WORKON_VIRTUALENV=$1
    fi

    workon $WORKON_VIRTUALENV
    unset WORKON_VIRTUALENV
}

function _mkvirtualenv_wrapper () {
    if [[ -z $1 ]]; then
        MKVIRTUALENV="${PWD##*/}"
    else
        MKVIRTUALENV=$1
    fi

    mkvirtualenv --python=$VIRTUALENVWRAPPER_PYTHON -a `pwd` $MKVIRTUALENV
    unset MKVIRTUALENV
}

function _rmvirtualenv_wrapper () {
    deactivate

    if [[ -z $1 ]]; then
        RMVIRTUALENV="${PWD##*/}"
    else
        RMVIRTUALENV=$(basename $VIRTUAL_ENV)
    fi

    rmvirtualenv $RMVIRTUALENV
    unset RMVIRTUALENV
}

alias mkvirtualenv="_mkvirtualenv_wrapper"
alias rmvirtualenv="_rmvirtualenv_wrapper"
alias refvirtualenv="rmvirtualenv && mkvirtualenv"
