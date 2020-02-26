# Some python configuration
export PYTHON_LINE_LENGTH=120
export TEXT_LINE_LENGTH=99

# Debugging python
export PYTHONBREAKPOINT=pudb.set_trace

# IPython debugger
export PYTHONSTARTUP=$DOTFILES/python/virtualenvwrapper/pythonstartup.py
export PYTHONDONTWRITEBYTECODE=1

# Python aliases
alias p='ipython3'
alias black='black --config $DOTFILES/python/blak-config.toml'
alias isort='isort --apply --jobs 4'

# Poetry aliases. To be overwritten when in a virtualenv
alias pytall='poetry run pytest --color yes --durations=10 -qk ""'
alias pytdbg='poetry run pytest --color yes --durations=10 -lvxs'
alias pytcov='pytall --cov ${PWD##*/} --cov-report term-missing'
