#!/usr/bin/zsh

function public-ip() {
    local PUBLIC_IP=$(curl -sL v4.ifconfig.co | awk '{ print $0 "/32" }')
    echo $PUBLIC_IP
}

function src() {
    exec zsh
}

function open-db {
    local db_command="cd $DB_DIR && nvim +Dirbuf && cd -"

    if test ! -d "${DB_DIR}"; then
        echo "$DB_DIR does not exist!"
        return
    fi

    if [[ "$TMUX" ]]; then
        tmux split-window -h $db_command
    else
        eval "${db_command}"
    fi

    zle reset-prompt
}

function owl() {
    echo
    echo "{o,o}"
    echo "./)_)"
    echo '  ""'
    echo
}

function search() {
    search_string="https://duckduckgo.com/?q="

    for word in $*; do
        search_string+="${word}+"
    done

    xdg-open $search_string
}
