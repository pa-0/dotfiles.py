# VirtualEnvWrapper
WORKON_HOME=$HOME/.local/share/virtualenvs
VIRTUALENVWRAPPER_HOOK_DIR=$DOTFILES/python/virtualenvwrapper
VIRTUALENVWRAPPER_SCRIPT=$HOME/.local/bin/virtualenvwrapper.sh
PIP_REQUIRE_VIRTUALENV=true
DEFAULT_PYTHON="/usr/bin/python3"
VIRTUALENVWRAPPER_PYTHON=$DEFAULT_PYTHON

alias mkvirtualenv='mkvirtualenv --python=$VIRTUALENVWRAPPER_PYTHON -a `pwd` ${PWD##*/}'
alias activate='workon ${PWD##*/}'
alias a='activate'
alias d='deactivate'
alias rmvirtualenv='deactivate && rmvirtualenv ${PWD##*/}'
alias refvirtualenv='deactivate && mkvirtualenv'

export WORKON_HOME VIRTUALENVWRAPPER_HOOK_DIR VIRTUALENVWRAPPER_PYTHON PIP_REQUIRE_VIRTUALENV

[[ -f $VIRTUALENVWRAPPER_SCRIPT ]] && source $VIRTUALENVWRAPPER_SCRIPT
