#!/bin/zsh

DISPLAYS=(`xrandr -q | awk '/ connected /{printf "%s ", $1}'`)

if [[ "${#DISPLAYS[@]}" == "2" ]]; then
    EXTERNDISPLAY=$DISPLAYS[-1]
    BUILTINDISPLAY=$DISPLAYS[1]
    xrandr --auto && \
        xrandr --output $EXTERNDISPLAY --primary --right-of $BUILTINDISPLAY \
               --output $BUILTINDISPLAY
    echo "Configuring $EXTERNDISPLAY and $BUILTINDISPLAY display setup"
else
    xrandr --auto
    echo "Configuring auto"
fi
