# Some python configuration
export PYTHON_LINE_LENGTH=120
export TEXT_LINE_LENGTH=99

alias black='black --config $DOTFILES/python/blak-config.toml'
alias isort='isort --apply --jobs 4'

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
