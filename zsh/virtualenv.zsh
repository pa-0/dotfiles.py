# VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenv
export PROJECT_HOME=$HOME/local
export PIP_REQUIRE_VIRTUALENV=true
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.7
source /usr/local/bin/virtualenvwrapper.sh

# Virtualenvwrapper stuff
alias gpip='PIP_REQUIRE_VIRTUALENV="" sudo pip'
alias mkvirtualenv='mkvirtualenv --python=$VIRTUALENVWRAPPER_PYTHON -a `pwd` `pwd | rev | cut -f 1 -d "/" | rev`'
alias rmvirtualenv='deactivate && rmvirtualenv `pwd | rev | cut -f 1 -d "/" | rev`'
alias refvirtualenv='rmvirtualenv && mkvirtualenv'
alias localtestutils='pip uninstall crwtestutils -y && pip install -e $HOME/rp/crwtestutils'
alias localcommon='pip uninstall crwcommon -y && pip install -e $HOME/rp/crwcommon'
alias localebay='pip uninstall crwebaycommon -y && pip install -e $HOME/rp/crwebaycommon'
alias black='black --config $HOME/.config/flake8-black/pyproject.toml'
