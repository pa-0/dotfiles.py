#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

launch_rofi() {
    rofi -modi drun -show drun -lines 5
}

launch_rofi "$@"
