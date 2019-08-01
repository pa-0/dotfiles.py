# DevInt Environment and docker stuff
alias devint='$HOME/rp/devint-environment/restart.sh -l 3 --proxies-enabled true -e dev --rules-enabled false --bots-config-env local --bots-config-branch develop'
alias rsgc='`docker run -d --rm --network host --shm-size=1gb selenium/standalone-chrome-debug`'
alias rsff='docker run -d --rm --network host --shm-size=1gb selenium/standalone-firefox-debug:3.7.1-beryllium'

# Pytest Aliases
alias pytall='pytest -nauto -qk "" --cov `pwd | rev | cut -f 1 -d "/" | rev` --cov-report term-missing'
alias pytdbg='pytest -lvxs'
