# Docker CLI Configuration

export DOCKER_BUILDKIT=1

# Alias docker commands
if [ "$(command -v docker)" ]; then
    docker() {
        if [[ $@ == "ps" ]]; then
            command docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}\t{{.Networks}}\t{{.Ports}}"
        elif [[ $@ == "stop all" ]]; then
            command docker stop $(docker ps -q)
        else
            command docker "$@"
        fi
    }
fi

alias dps='docker ps'
alias dsa='docker stop all'
alias dcb='docker-compose build --parallel'
alias dcu='docker-compose up'
alias dcd='docker-compose down --remove-orphans'
alias dcr='docker-compose run'
