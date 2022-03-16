# Python configs

export PYTHON_LINE_LENGTH=120
export TEXT_LINE_LENGTH=99

# Debugging python
export PYTHONBREAKPOINT=ipdb.set_trace
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# IPython debugger
export PYTHONSTARTUP=$DOTFILES/python/virtualenvwrapper/pythonstartup.py
export PYTHONDONTWRITEBYTECODE=1

DEFAULT_PYTHON=$(command -v python3)

# Pyenv initialisation
if [[ $(command -v pyenv) && -d $PYENV_ROOT ]]; then
    path+="$PYENV_ROOT/bin"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

# Mac OS Pip user install
PIP_USER_PATH="$HOME/Library/Python/3.8/bin"
test -d $PIP_USER_PATH && path+="$PIP_USER_PATH"

# PYthon related functions
pyclean() {
    find . -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
}

# Pip aliases
alias gpip='PIP_REQUIRE_VIRTUALENV="" $DEFAULT_PYTHON -m pip'
alias gpl='gpip list'
alias pl='python3 -m pip list'

# Python aliases
alias p='ipython3'
alias black='black --config $DOTFILES/python/black-config.toml'
alias isort='isort --jobs 4'
alias mypy='mypy --config-file $DOTFILES/python/mypy.ini'
alias yamllint='yamllint -c $DOTFILES/python/yamllint.yml'

# Poetry aliases. To be overwritten when in a virtualenv
alias pd='poetry run pytest --color yes -lvxs'
alias pa='clear; poetry run pytest --color yes --durations=10 -qk ""'
alias pap='pa -n4'
alias pc='pa --cov ${PWD##*/} --cov-report term-missing'
alias pdj='pa --cov --cov-report term-missing'
alias pdjc='pdj --cov-report html'

# Poetry aliases for django commands
alias djm='poetry run ./manage.py'

[[ -f $DOTFILES/python/virtualenv.zsh ]] && source "$DOTFILES/python/virtualenv.zsh"
