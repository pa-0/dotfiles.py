#!/usr/bin/sh

DOTFILES=$HOME/.dotfiles

# Launch polybar
start_polybar () {
    killall -wq polybar
    for monitor in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$monitor polybar -c "$DOTFILES/polybar/config" main &
    done
}

# Keyboard stuff
keyboards () {
    [ "$(command -v setxkbmap)" ] && \
    setxkbmap \
        -layout "us,es" \
        -option "grp:alt_space_toggle" \
        -option "caps:escape"
}

main () {
    start_polybar
    keyboards
}

main
