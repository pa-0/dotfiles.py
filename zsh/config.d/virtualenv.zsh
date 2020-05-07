# VirtualEnvWrapper
WORKON_HOME=$HOME/.local/share/virtualenvs
VIRTUALENVWRAPPER_HOOK_DIR=$DOTFILES/python/virtualenvwrapper/
VIRTUALENVWRAPPER_SCRIPT=$HOME/.local/bin/virtualenvwrapper.sh
PIP_REQUIRE_VIRTUALENV=true

SYSTEM_PYTHON="/usr/bin/python3"
if [ "$(command -v $SYSTEM_PYTHON)" ]
then
    VIRTUALENVWRAPPER_PYTHON="$SYSTEM_PYTHON"
else
    echo "Python interpreter not found at $SYSTEM_PYTHON"
fi

alias gpip='PIP_REQUIRE_VIRTUALENV="" $SYSTEM_PYTHON -m pip'
alias gpl='gpip list'
alias pl='python3 -m pip list'

alias mkvirtualenv='mkvirtualenv --python=$VIRTUALENVWRAPPER_PYTHON -a `pwd` ${PWD##*/}'
alias activate='workon ${PWD##*/}'
alias a='activate'
alias d='deactivate'
alias r='reactivate'
alias reactivate='deactivate && activate'
alias rmvirtualenv='deactivate && rmvirtualenv ${PWD##*/}'
alias refvirtualenv='deactivate && mkvirtualenv'

export WORKON_HOME VIRTUALENVWRAPPER_HOOK_DIR VIRTUALENVWRAPPER_PYTHON PIP_REQUIRE_VIRTUALENV

[[ -f $VIRTUALENVWRAPPER_SCRIPT ]] && source $VIRTUALENVWRAPPER_SCRIPT
