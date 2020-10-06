# Python configs

export PYTHON_LINE_LENGTH=120
export TEXT_LINE_LENGTH=99

# Debugging python
export PYTHONBREAKPOINT=ipdb.set_trace

# IPython debugger
export PYTHONSTARTUP=$DOTFILES/python/virtualenvwrapper/pythonstartup.py
export PYTHONDONTWRITEBYTECODE=1

# Python aliases
alias p='ipython3'
alias black='black --config $DOTFILES/python/black-config.toml'
alias isort='isort --jobs 4'
alias mypy='mypy --config-file $DOTFILES/python/mypy.ini'

# Poetry aliases. To be overwritten when in a virtualenv
if [ "$(command -v poetry)" ]
then
    alias pa='poetry run pytest --color yes --durations=10 --forked -nauto -qk ""'
    alias pd='poetry run pytest --color yes --durations=10 -lvxs'
    alias pc='pa --cov ${PWD##*/} --cov-report term-missing'
fi

[[ -f $DOTFILES/python/virtualenv.zsh ]] && source $DOTFILES/python/virtualenv.zsh
