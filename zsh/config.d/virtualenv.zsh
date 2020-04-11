# VirtualEnvWrapper
export WORKON_HOME=$HOME/.local/virtualenv
export VIRTUALENVWRAPPER_HOOK_DIR=$DOTFILES/python/virtualenvwrapper/

PYTHON_375=$HOME/.local/install/cpython-3.7.5
if [[ -d $PYTHON_375 ]]; then
    export VIRTUALENVWRAPPER_PYTHON=$PYTHON_375/bin/python3
else
    export VIRTUALENVWRAPPER_PYTHON=$(which python3)
fi

[[ -f $(which virtualenvwrapper.sh 2> /dev/null ) ]] && source $(which virtualenvwrapper.sh)

export PIP_REQUIRE_VIRTUALENV=true
alias gpip='PIP_REQUIRE_VIRTUALENV="" sudo python3 -m pip'
alias pl='python3 -m pip list'

alias mkvirtualenv='mkvirtualenv --python=$VIRTUALENVWRAPPER_PYTHON -a `pwd` ${PWD##*/}'
alias activate='workon ${PWD##*/}'
alias reactivate='deactivate && activate'
alias rmvirtualenv='deactivate && rmvirtualenv ${PWD##*/}'
alias refvirtualenv='deactivate && mkvirtualenv'
