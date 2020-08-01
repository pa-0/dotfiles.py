#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

xrandr --output "$MAIN_SCREEN" --primary --mode 2560x1440 --rate 144.00 --pos 1080x0 --rotate normal \
    --output "$VERTICAL_SCREEN" --mode 1920x1080 --pos 0x0 --rotate right --rate 60
