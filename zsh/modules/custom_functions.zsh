#!/usr/bin/zsh

function public-ip() {
    local PUBLIC_IP=$(curl -sL v4.ifconfig.co | awk '{ print $0 "/32" }')
    echo $PUBLIC_IP
}

function src() {
    exec zsh
}

function open-db() {
    zle
    open-db-dir "cd $DB_DIR && nvim +Dirbuf && cd -"
    zle reset-prompt
}

function owl() {
    echo
    echo "{o,o}"
    echo "./)_)"
    echo '  ""'
    echo
}

function kitty() {
    echo ""
    echo "  /\\___/\\"
    echo " ( o   o )"
    echo " (  =^=  )"
    echo " (        )"
    echo " (         )"
    echo " (          )))))))))))"
    echo ""
}

function search() {
    search_string="https://duckduckgo.com/?q="

    for word in $*; do
        search_string+="${word}+"
    done

    xdg-open $search_string
}
