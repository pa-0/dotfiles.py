#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

xrandr --output "$EXTERNAL_SCREEN" --primary --auto --rotate right --output "$LAPTOP_SCREEN" --off
