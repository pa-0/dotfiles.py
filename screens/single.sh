#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

xrandr --output "$MAIN_SCREEN" --primary --mode 2560x1440 --rate 144.0 --rotate normal --output "$SECONDARY_SCREEN" --off
