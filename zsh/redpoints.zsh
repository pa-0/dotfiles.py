# Virtualenv aliases
alias localtestutils='pip uninstall crwtestutils -y && pip install -e $HOME/rp/common/crwtestutils'
alias localcommon='pip uninstall crwcommon -y && pip install -e $HOME/rp/common/crwcommon'
alias localebay='pip uninstall crwebaycommon -y && pip install -e $HOME/rp/common/crwebaycommon'
alias black='black --config $HOME/.config/flake8-black/pyproject.toml'

# DevInt Environment and docker stuff
alias devint='$HOME/rp/devint-environment/restart.sh -l 3 --proxies-enabled true -e dev --rules-enabled false --bots-config-env local --bots-config-branch develop'
alias rsgc='`docker run -d --rm --network host --shm-size=1gb selenium/standalone-chrome-debug`'
alias rsff='docker run -d --rm --network host --shm-size=1gb selenium/standalone-firefox-debug:3.7.1-beryllium'

# Pytest Aliases
alias pytall='pytest -nauto -qk "" --cov `pwd | rev | cut -f 1 -d "/" | rev` --cov-report term-missing'
alias pytdbg='pytest -lvxs'
