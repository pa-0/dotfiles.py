#!/usr/bin/bash

# shellcheck disable=SC1090
xrandr \
    --output "$MAIN_SCREEN" \
    --mode 1920x1080 \
    --rate 60 \
    --output "$LAPTOP_SCREEN" \
    --primary \
    --mode 1920x1080 \
    --rate 60
