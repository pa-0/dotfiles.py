#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

xrandr --output "$MAIN_SCREEN" --primary --auto --output "$VERTICAL_SCREEN" --left-of "$MAIN_SCREEN"
