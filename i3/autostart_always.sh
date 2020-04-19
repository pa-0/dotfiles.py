#!/usr/bin/sh

# DOTFILES
export DOTFILES=$HOME/.dotfiles

# Launch polybar
start_polybar () {
    killall -wq polybar

    if [ "$(command -v xrandr)" ]
    then
        for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
            MONITOR=$monitor polybar -c "$DOTFILES/i3/polybar/config" --reload fjovell &
        done
    else
        polybar -c "$DOTFILES/i3/polybar/config" --reload fjovell &
    fi
}

custom_xrandr () {
    echo "1=$1 2=$2"
    if [ "$1" != "$2" ]
    then
        xrandr --auto && \
            xrandr --output "$1" --primary --left-of "$2" --output "$2"
    else
        xrandr --auto
    fi
}

displays () {
    # we want word splitting so custom_xrandr picks up the two arguments
    custom_xrandr $(xrandr --listmonitors | awk '{print$4}')
}

main () {
    start_polybar
    displays
}

main
