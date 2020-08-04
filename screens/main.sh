#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

xrandr --output "$EXTERNAL_SCREEN" --primary --auto --output "$LAPTOP_SCREEN" --left-of "$EXTERNAL_SCREEN" --auto
