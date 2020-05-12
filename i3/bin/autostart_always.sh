#!/usr/bin/sh

# Launch polybar
start_polybar () {
    killall -wq polybar

    if [ "$(command -v xrandr)" ]
    then
        for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
            MONITOR=$monitor polybar -c "$DOTFILES/polybar/config" main &
        done
    else
        polybar -c "$DOTFILES/polybar/config" main &
    fi
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
