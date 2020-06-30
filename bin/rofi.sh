#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

launch_rofi ()
{
    rofi -modi drun -show drun -lines 7
}

launch_rofi "$@"
