# Redpoints stuff
RP_COMMON=$HOME/rp/common
DEVINT_HOME=$HOME/rp/devint-environment

alias localtestutils='pip uninstall crwtestutils -y && pip install -e $RP_COMMON/crwtestutils'
alias localcommon='pip uninstall crwcommon -y && pip install -e $RP_COMMON/crwcommon'
alias localebay='pip uninstall crwebaycommon -y && pip install -e $RP_COMMON/crwebaycommon'
alias localmercadolibre='pip uninstall crwmercadolibrecommon -y && pip install -e $RP_COMMON/crwmercadolibrecommon'
alias localbot='pip uninstall ${PWD##*/} -y && pip install -e .'
alias black='black --config $HOME/.config/flake8-black/pyproject.toml'

# Selenium dockers
alias rsgc='docker run -d --rm --network host --shm-size=1gb selenium/standalone-chrome-debug'
alias rsff='docker run -d --rm --network host --shm-size=1gb selenium/standalone-firefox-debug:3.7.1-beryllium'

# Pytest Aliases
alias pytall='pytest -nauto -qk "" --cov ${PWD##*/} --cov-report term-missing'
alias pytdbg='pytest -lvxs'

function deprecate_old_python() {
    find -name "*.py" -type f -exec sed -i '/# -\*- coding: utf-8 -\*-/d' {} +
    find -name "*.py" -type f -exec sed -i '/from __future__ import unicode_literals/d' {} +
    find -name "*.py" -type f -exec sed -i -E 's/super\([[:alpha:]]+, self\)/super()/' {} +
    find -name "*.py" -type f -exec sed -i -E 's|\(object\)||' {} +
    black .
}

function find_and_rm() {
    sudo find . -type f -name "*.py[co]" -delete 
    sudo find . -type d -name "__pycache__" -delete
}

function devint() {
    RESTART_DEVINT=$DEVINT_HOME/restart.sh
    LEVEL=3
    PROXIES_ENABLED="true"
    ENVIRONEMNT="e"
    RULES="false"
    BOTS_CONFIG_ENV="local"
    if [[ -z $1 ]]; then
        BOTS_CONFIG_BRANCH="develop"
    else
        BOTS_CONFIG_BRANCH=BOTSCONFIG-$1
    fi

    $RESTART_DEVINT -l $LEVEL -e $ENVIRONEMNT \
        --proxies-enabled $PROXIES_ENABLED \
        --rules-enabled $RULES \
        --bots-config-env $BOTS_CONFIG_ENV \
        --bots-config-branch $BOTS_CONFIG_BRANCH
    unset RESTART_DEVINT LEVEL PROXIES_ENABLED ENVIRONEMNT RULES BOTS_CONFIG_ENV BOTS_CONFIG_BRANCH
}
