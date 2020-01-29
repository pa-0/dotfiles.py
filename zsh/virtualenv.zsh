# VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export VIRTUALENVWRAPPER_PYTHON=$HOME/.local/install/cpython-3.7.5/bin/python3

[[ -f $(which virtualenvwrapper_lazy.sh 2> /dev/null ) ]] && source $(which virtualenvwrapper_lazy.sh)

alias gpip='PIP_REQUIRE_VIRTUALENV="" sudo python3 -m pip'
alias pl='python3 -m pip list'

alias mkvirtualenv='mkvirtualenv --python=$VIRTUALENVWRAPPER_PYTHON -a `pwd` ${PWD##*/}'
alias activate='workon ${PWD##*/}'
alias rmvirtualenv='rmvirtualenv ${PWD##*/}'
alias refvirtualenv='deactivate && mkvirtualenv'
