#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

xrandr \
    --output "$MAIN_SCREEN" \
    --primary \
    --mode 1920x1080 \
    --rotate normal
