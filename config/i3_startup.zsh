#!/bin/zsh

# Displays config
EXTERNDISPLAY="DP-1-1"
EXTERNDISPLAYRESOLUTION="1920x1080"
EXTERNDISPLAYRATE="60.0"

BUILTINDISPLAY="eDP-1"
BUILTINDISPLAYRESOLUTION="1920x1080"
BUILTINDISPLAYRATE="60.0"

DISPLAYS=(`xrandr | awk '/ connected /{printf "%s ", $1}'`)

if [[ "${#DISPLAYS[@]}" == "2" ]]; then
    XRANDR_OPTIONS="--output \"$EXTERNDISPLAY\" --primary --left-of \"$BUILTINDISPLAY\" \
        --mode \"$EXTERNDISPLAYRESOLUTION\" \
        --refresh \"$EXTERNDISPLAYRATE\" \
        --output \"$BUILTINDISPLAY\" \
        --mode \"$BUILTINDISPLAYRESOLUTION\" \
        --refresh \"$BUILTINDISPLAYRATE\""
    echo "Configuring Work display setup"
else
    XRANDR_OPTIONS="--auto"
    echo "Configuring auto"
fi

# Xandr command to run at startup
xrandr $XRANDR_OPTIONS
