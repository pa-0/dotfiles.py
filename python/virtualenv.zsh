PIP_REQUIRE_VIRTUALENV=true
WORKON_HOME=$HOME/.local/share/virtualenvs
VIRTUALENVWRAPPER_HOOK_DIR=$DOTFILES/python/virtualenvwrapper

alias mkv='mkvirtualenv -a $PWD ${PWD##*/}'
alias rmv='deactivate && rmvirtualenv ${PWD##*/}'
alias a='workon ${PWD##*/}'
alias d='deactivate'

export WORKON_HOME VIRTUALENVWRAPPER_HOOK_DIR PIP_REQUIRE_VIRTUALENV

[[ -f $VIRTUALENVWRAPPER_SCRIPT ]] && source "$VIRTUALENVWRAPPER_SCRIPT"
