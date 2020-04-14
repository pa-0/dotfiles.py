# VirtualEnvWrapper
WORKON_HOME=$HOME/.local/virtualenv
VIRTUALENVWRAPPER_HOOK_DIR=$DOTFILES/python/virtualenvwrapper/
PYTHON_375=$HOME/.local/install/cpython-3.7.5

if [[ -d $PYTHON_375 ]]; then
    VIRTUALENVWRAPPER_PYTHON=$PYTHON_375/bin/python3
else
    VIRTUALENVWRAPPER_PYTHON=$(command -v python3)
fi

[[ -f $(command -v virtualenvwrapper_lazy.sh) ]] && source $(command -v virtualenvwrapper_lazy.sh)

PIP_REQUIRE_VIRTUALENV=true

export WORKON_HOME VIRTUALENVWRAPPER_HOOK_DIR VIRTUALENVWRAPPER_PYTHON PIP_REQUIRE_VIRTUALENV

alias gpip='PIP_REQUIRE_VIRTUALENV="" sudo python3 -m pip'
alias pl='python3 -m pip list'

alias mkvirtualenv='mkvirtualenv --python=$VIRTUALENVWRAPPER_PYTHON -a `pwd` ${PWD##*/}'
alias activate='workon ${PWD##*/}'
alias reactivate='deactivate && activate'
alias rmvirtualenv='deactivate && rmvirtualenv ${PWD##*/}'
alias refvirtualenv='deactivate && mkvirtualenv'
