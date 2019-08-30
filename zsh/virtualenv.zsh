# VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenv
export PROJECT_HOME=$HOME/local
export PIP_REQUIRE_VIRTUALENV=true
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.7
source /usr/local/bin/virtualenvwrapper.sh

# Virtualenvwrapper stuff
alias gpip='PIP_REQUIRE_VIRTUALENV="" sudo pip'
alias mkvirtualenv='mkvirtualenv --python=$VIRTUALENVWRAPPER_PYTHON -a `pwd` ${PWD##*/}'
alias rmvirtualenv='deactivate && rmvirtualenv ${PWD##*/}'
alias refvirtualenv='rmvirtualenv && mkvirtualenv'
