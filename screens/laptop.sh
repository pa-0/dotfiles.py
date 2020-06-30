#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

xrandr --output "$LAPTOP_SCREEN" --primary --auto --output "$EXTERNAL_SCREEN" --off
