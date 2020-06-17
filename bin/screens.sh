#!/usr/bin/bash

main ()
{
    local LAPTOP_SCREEN="eDP-1"
    local EXTERNAL_SCREEN="HDMI-1"
    local POSITION="left"

    while getopts "lea" ARG
    do
        case $ARG in
            l ) xrandr --auto && xrandr --output "$LAPTOP_SCREEN" --primary --output "$EXTERNAL_SCREEN" --off ;;
            e ) xrandr --auto && xrandr --output "$EXTERNAL_SCREEN" --primary --output "$LAPTOP_SCREEN" --off ;;
            a ) xrandr --auto && xrandr --output "$EXTERNAL_SCREEN" --primary --output "$LAPTOP_SCREEN" --"$POSITION"-of "$LAPTOP_SCREEN" ;;
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

main "$@"
