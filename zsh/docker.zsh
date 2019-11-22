# Alias docker commands
#
function docker () {
    if [[ $@ == "ps" ]]; then
        command docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}\t{{.Networks}}\t{{.Ports}}"
    else
        command docker "$@"
    fi
}
