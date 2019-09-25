# VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenv
export PROJECT_HOME=$HOME/rp
export PIP_REQUIRE_VIRTUALENV=true
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.7

virtualenvwrapper=/usr/local/bin/virtualenvwrapper_lazy.sh
[[ -f $virtualenvwrapper ]] && source $virtualenvwrapper

# Virtualenvwrapper stuff
alias gpip='PIP_REQUIRE_VIRTUALENV="" sudo pip'
alias activate='workon ${PWD##*/}'
alias mkvirtualenv='mkvirtualenv --python=$VIRTUALENVWRAPPER_PYTHON -a `pwd` ${PWD##*/}'
alias rmvirtualenv='deactivate && rmvirtualenv ${PWD##*/}'
alias refvirtualenv='rmvirtualenv && mkvirtualenv'
