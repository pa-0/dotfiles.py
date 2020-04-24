#!/usr/bin/sh

# DOTFILES
export DOTFILES=$HOME/.dotfiles

get_connected_monitors () {
    xrandr --query | grep " connected" | cut -d" " -f1
}

# Launch polybar
start_polybar () {
    killall -wq polybar

    if [ "$(command -v xrandr)" ]
    then
        for monitor in $(get_connected_monitors); do
            MONITOR=$monitor polybar -c "$DOTFILES/i3/polybar/config" --reload fjovell &
        done
    else
        polybar -c "$DOTFILES/i3/polybar/config" --reload fjovell &
    fi
}

custom_xrandr () {
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
    custom_xrandr $(get_connected_monitors)
}

# Keyboard stuff
keyboards () {
    [ "$(command -v setxkbmap)" ] && \
    setxkbmap \
        -layout "us,es" \
        -option "grp:alt_shift_toggle" \
        -option "caps:escape"
}

main () {
    start_polybar
    displays
    keyboards
}

main
