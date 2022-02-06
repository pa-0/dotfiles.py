#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

launch_rofi() {
    rofi -modi drun -theme applications -show-icons -show drun
}

launch_rofi "$@"
