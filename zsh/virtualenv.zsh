# Virtualenv Wrapper for pyenv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export VIRTUALENV_PYTHON_VERSION=3.7.5

# TODO: Make a wrapper for virtualenvwrapper so that witha  single command I can do everything?
alias gpip='PIP_REQUIRE_VIRTUALENV="" sudo $(which python) -m pip'
alias pl='pip list'

# Wrap pyenv-virtualenv for virtualenvwrapper kind of behaviour

function activate () {
    if [[ -z $1 ]]; then
        WORKON_VIRTUALENV="${PWD##*/}"
    else
        WORKON_VIRTUALENV=$1
    fi

    pyenv activate $WORKON_VIRTUALENV

    source $DOTFILES/python/virtualenvwrapper/postactivate

    unset WORKON_VIRTUALENV
}

function _deactivate_wrapper () {
    source $DOTFILES/python/virtualenvwrapper/predeactivate

    pyenv deactivate
}

alias deactivate='_deactivate_wrapper'

function mkvirtualenv () {
    if [[ -z $1 ]]; then
        MKVIRTUALENV="${PWD##*/}"
    else
        MKVIRTUALENV=$1
    fi

    pyenv virtualenv $VIRTUALENV_PYTHON_VERSION $MKVIRTUALENV

    activate $MKVIRTUALENV

    source $DOTFILES/python/virtualenvwrapper/postmkvirtualenv

    unset MKVIRTUALENV
}

function rmvirtualenv () {
    if [[ -z $1 ]]; then
        VIRTUALENV="${PWD##*/}"
    else
        VIRTUALENV=$1
    fi

    pyenv uninstall -f $VIRTUALENV
}

function refvirtualenv () {
    rmvirtualenv
    mkvirtualenv
}
