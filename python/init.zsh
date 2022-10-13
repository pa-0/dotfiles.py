# Python configs

export PYTHON_LINE_LENGTH=120
export TEXT_LINE_LENGTH=99

# Debugging python
export PYTHONBREAKPOINT=ipdb.set_trace
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# IPython debugger
export PYTHONSTARTUP="$DOTFILES/python/virtualenvwrapper/pythonstartup.py"
export PYTHONDONTWRITEBYTECODE=1

if [[ $(command -v pyenv) ]]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    pyenv virtualenvwrapper
fi

if [[ $(command -v rbenv) ]]; then
    eval "$(rbenv init - zsh)"
fi

path+=$HOME/Library/Python/3.9/bin

# PYthon related functions
pyclean() {
    find . -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
}

alias upgrade-pip='pip install pip --upgrade'
alias upgrade-global-pip='PIP_REQUIRE_VIRTUALENV="" pip install pip --upgrade'

# Python aliases
alias fjm-black='black --config $DOTFILES/python/black-config.toml'
alias fjm-isort='isort --jobs 4'
alias fjm-mypy='mypy --config-file $DOTFILES/python/mypy.ini'
alias fjm-yamllint='yamllint -c $DOTFILES/python/yamllint.yml'
alias pr='poetry run'
alias prp='pr python'

alias pyf='isort . && black .'
alias pd='pytest --color yes -lvxs'
alias pa='clear; pytest --color yes --durations=10 -qk ""'
alias pap='pa -n 4'
alias pdj='pap --cov --cov-report term-missing'
alias pdjc='pdj -n 4 --cov-report html'

alias djm='python ./manage.py'

test -e "$DOTFILES/python/virtualenv.zsh" && source "$DOTFILES/python/virtualenv.zsh"
