#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

xrandr --output "$MAIN_SCREEN" --primary --mode 2560x1440 --pos 1920x0 --rotate normal
