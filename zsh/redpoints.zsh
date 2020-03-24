# Redpoints stuff
RP=$HOME/rp
export RP_LIBRARIES=$RP/libraries
export BOTS_CONFIG=$RP/config
DEVINT_HOME=$HOME/rp/devint-environment

# Selenium dockers
alias rsgc='docker run -d --rm --network host --shm-size=1gb selenium/standalone-chrome-debug'
alias rsff='docker run -d --rm --network rp_default --link redpoints-proxy-luminati:proxy.dev.redpoints.com -p 4444:4444 -p 5900:5900 -v /tmp:/tmp -v /dev/shm:/dev/shm --shm-size=1gb selenium/standalone-firefox-debug:3.7.1-beryllium'

# Functions
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
    MIRRORRESOLVER_ENABLED="true"
    ENVIRONEMNT="dev"
    RULES="false"
    BOTS_CONFIG_ENV="local"
    if [[ -z $1 ]]; then
        BOTS_CONFIG_BRANCH="develop"
    else
        BOTS_CONFIG_BRANCH=BOTSCONFIG-$1
    fi

    cd $DEVINT_HOME

    $RESTART_DEVINT -l $LEVEL -e $ENVIRONEMNT \
        --proxies-enabled $PROXIES_ENABLED \
        --mirrorresolver-enabled $MIRRORRESOLVER_ENABLED\
        --bots-config-env $BOTS_CONFIG_ENV \
        --bots-config-branch $BOTS_CONFIG_BRANCH

    export BOTS_CONFIG_BRANCH
    unset RESTART_DEVINT LEVEL PROXIES_ENABLED ENVIRONEMNT RULES BOTS_CONFIG_ENV
    cd -
}

alias fulldevint='./restart.sh -l 10 -s ipr -e dev --mlservice-enabled true --proxies-enabled true --bots-config-branch develop --rulesdispatcher-enabled false --rules-enabled false --full-env true --scripts CRW/updateTestingExtraInfo.sh'

function check_proxies () {
    python3 $DOTFILES/python/check_proxies.py
}
