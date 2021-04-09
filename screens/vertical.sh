#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

xrandr --output "$MAIN_SCREEN" --off\
    --output "$SECONDARY_SCREEN" --mode 2560x1440 --pos 0x0 --rotate left --rate 60
