#!/usr/bin/sh

test "$LAPTOP_SCREEN" || LAPTOP_SCREEN="eDP-1"
test "$EXTERNAL_SCREEN" || EXTERNAL_SCREEN="HDMI-1"
test "$POSITION" || POSITION="left"

# Three possibilities:

# - Only laptop screen (eDP-1)
only_laptop_screen () {
    xrandr --auto
    xrandr --output "$LAPTOP_SCREEN" --primary --output "$EXTERNAL_SCREEN" --off
}

# - Only external screen (HDMI-1)
only_external_screen () {
    xrandr --auto
    xrandr --output "$EXTERNAL_SCREEN" --primary --output "$LAPTOP_SCREEN" --off
}

# - Both monitors
two_screen () {
    xrandr --auto
    xrandr --output "$EXTERNAL_SCREEN" --primary --output "$LAPTOP_SCREEN" --"$POSITION"-of "$LAPTOP_SCREEN"
}

screens ()
{
    while getopts "lea" ARG
    do
        case $ARG in
            l )
                only_laptop_screen
                ;;
            e )
                only_external_screen
                ;;
            a )
                two_screen
                ;;
            \? )
                echo "Option Unrecognized"
                echo "Usage:"
                echo "  $0 -lea"
                echo "  -l: Only laptop screen."
                echo "  -e: Only external screen."
                echo "  -a: All Screens."
                echo
                exit 1
                ;;
        esac
    done

    i3-msg reload
    i3-msg restart
}

Screens "$@"
