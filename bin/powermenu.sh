#!/bin/bash

poweroff() {
    systemctl poweroff
}

reboot() {
    systemctl reboot
}

logout() {
    i3-msg exit
}

lock() {
    sleep .2 && "$DOTFILES/bin/lock.sh"
}

suspend() {
    systemctl suspend && i3lock -nfe --color=2e3440
}

powermenu() {
    MESSAGE="Que hem de fer?"
    POWER=" "
    RESTART=" "
    LOGOUT=" "
    LOCK=" "
    SUSPEND=" "

    RES=$(echo "$LOCK|$SUSPEND|$POWER|$RESTART|$LOGOUT" | rofi -dmenu -p "$MESSAGE" -sep "|" -theme powermenu)

    [ "$RES" = "$POWER" ] && poweroff
    [ "$RES" = "$RESTART" ] && reboot
    [ "$RES" = "$LOGOUT" ] && logout
    [ "$RES" = "$LOCK" ] && logout
    [ "$RES" == "$SUSPEND" ] && suspend
}

powermenu
