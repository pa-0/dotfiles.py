# Redpoints stuff
RP=$HOME/rp
local DEVINT_HOME=$RP/devint-environment

# Go to main RP directory
alias rp='cd $RP && clear'

# Some python configuration
export PYTHON_LINE_LENGTH=120
export TEXT_LINE_LENGTH=99

# Debugging python
export PYTHONBREAKPOINT=ipdb.set_trace

# IPython debugger
export PYTHONSTARTUP=$DOTFILES/python/virtualenvwrapper/pythonstartup.py
export PYTHONDONTWRITEBYTECODE=1

# Selenium dockers
alias rsgc='docker run -d --rm --network host --shm-size=1gb selenium/standalone-chrome-debug'
alias rsff='docker run -d --rm --network rp_default --link redpoints-proxy-luminati:proxy.dev.redpoints.com -p 4444:4444 -p 5900:5900 -v /tmp:/tmp -v /dev/shm:/dev/shm --shm-size=1gb selenium/standalone-firefox-debug:3.7.1-beryllium'

# Python aliases
alias p='ipython3'
alias black='black --config $DOTFILES/python/black-config.toml'
alias isort='isort --apply --jobs 4'

# Poetry aliases. To be overwritten when in a virtualenv
alias pytall='poetry run pytest --color yes --durations=10 -qk ""'
alias pytdbg='poetry run pytest --color yes --durations=10 -lvxs'
alias pytcov='pytall --cov ${PWD##*/} --cov-report term-missing'

# TODO: Runs tests and captures JSON output
# Make it so that you also see the logs and greps output into a file
# pytdbg -k TestCaseNameThatShouldBeAParameter 2>&1 | tee output.log | grep -oP "Output data:\K {.+}$" | jq > output_data.json

# Functions
deprecate_old_python () {
    find -name "*.py" -type f -exec sed -i '/# -\*- coding: utf-8 -\*-/d' {} +
    find -name "*.py" -type f -exec sed -i '/from __future__ import unicode_literals/d' {} +
    find -name "*.py" -type f -exec sed -i -E 's/super\([[:alpha:]]+, self\)/super()/' {} +
    find -name "*.py" -type f -exec sed -i -E 's|\(object\)||' {} +
    black .
}

find_and_rm () {
    sudo find . -type f -name "*.py[co]" -delete
    sudo find . -type d -name "__pycache__" -delete
}

# Run tests in the docker
pytdocker () {
    find_and_rm
    sed -i 's/bamboo/dev/g' pytest.ini
    sed -i 's/project:/project:\n    network_mode: host/g' tests/docker-compose.yml
    docker-compose -f tests/docker-compose.yml build project
    docker-compose -f tests/docker-compose.yml run project flake8
    docker-compose -f tests/docker-compose.yml run project
    git restore pytest.ini tests/docker-compose.yml
}

# TODO: Run docker from SNAPSHOT/PRODUCTION
# docker run --rm -i --network host -e BOTS_CONFIG_BRANCH=develop -e LOG_LEVEL=DEBUG registry.rdpnts.com/bots/monitor-amazonca:SNAPSHOT monitor --run-local < qa_input.json | tee qa_output.json | jq

# Start devint
restart_devint () {
    cd $DEVINT_HOME
    local RESTART_DEVINT=$DEVINT_HOME/restart.sh
    $RESTART_DEVINT -l $LEVEL -e $ENVIRONEMNT -s $SUITE \
        --proxies-enabled $PROXIES_ENABLED \
        --mirrorresolver-enabled $MIRRORRESOLVER_ENABLED \
        --aws-mock-enabled $AWSMOCK_ENABLED \
        --bots-config-env $BOTS_CONFIG_ENV \
        --bots-config-branch $BOTS_CONFIG_BRANCH \
        $@
    cd -
}

devint () {
    local LEVEL=3
    local SUITE="ipr"
    local PROXIES_ENABLED="true"
    local MIRRORRESOLVER_ENABLED="false"
    local AWSMOCK_ENABLED="true"
    local ENVIRONEMNT="dev"
    local RULES="false"
    local BOTS_CONFIG_ENV="local"
    local BOTS_CONFIG_BRANCH="develop"

    restart_devint
}

fulldevint () {
    local LEVEL=10
    local SUITE="ipr"
    local PROXIES_ENABLED="true"
    local MIRRORRESOLVER_ENABLED="false"
    local ML_SERVICE="true"
    local RULES_DISPATCHER="true"
    local RULES_ENABLED="false"
    local FULL_ENV="true"
    local SCRIPT="CRW/updateTestingExtraInfo.sh"
    local AWSMOCK_ENABLED="true"
    local ENVIRONEMNT="dev"
    local RULES="false"
    local BOTS_CONFIG_ENV="local"
    local BOTS_CONFIG_BRANCH="develop"

    restart_devint --mlservice-enabled $ML_SERVICE --rulesdispatcher-enabled $RULES_DISPATCHER --rules-enabled $RULES_ENABLED --full-env $FULL_ENV --scripts $SCRIPT
}

check_proxies () {
    python3 $DOTFILES/python/check_proxies.py
}
