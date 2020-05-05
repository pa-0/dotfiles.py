# VirtualEnvWrapper
WORKON_HOME=$HOME/.local/virtualenv
VIRTUALENVWRAPPER_HOOK_DIR=$DOTFILES/python/virtualenvwrapper/
VIRTUALENVWRAPPER_PYTHON=$(command -v python3)
VIRTUALENVWRAPPER_SCRIPT=$HOME/.local/bin/virtualenvwrapper.sh
PIP_REQUIRE_VIRTUALENV=true

alias gpip='PIP_REQUIRE_VIRTUALENV="" python3 -m pip'
alias gpl='gpip list'
alias pl='python3 -m pip list'

alias mkvirtualenv='mkvirtualenv --python=$VIRTUALENVWRAPPER_PYTHON -a `pwd` ${PWD##*/}'
alias activate='workon ${PWD##*/}'
alias a='activate'
alias reactivate='deactivate && activate'
alias rmvirtualenv='deactivate && rmvirtualenv ${PWD##*/}'
alias refvirtualenv='deactivate && mkvirtualenv'

export WORKON_HOME VIRTUALENVWRAPPER_HOOK_DIR VIRTUALENVWRAPPER_PYTHON PIP_REQUIRE_VIRTUALENV

[[ -f $VIRTUALENVWRAPPER_SCRIPT ]] && source $VIRTUALENVWRAPPER_SCRIPT
