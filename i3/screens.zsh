#!/bin/zsh

function custom_xrandr () {
    if [[ $EXTERNDISPLAY != $BUILTINDISPLAY ]]; then
        xrandr --auto && \
            xrandr --output $EXTERNDISPLAY --primary --right-of $BUILTINDISPLAY \
                --output $BUILTINDISPLAY
        echo "Configuring $EXTERNDISPLAY and $BUILTINDISPLAY display setup"
    else
        xrandr --auto
        echo "Configuring auto"
    fi
}

function displays () {
    DISPLAYS=(`xrandr -q | awk '/ connected /{printf "%s ", $1}'`)

    if [[ "${#DISPLAYS[@]}" == "2" ]]; then
        export EXTERNDISPLAY=$DISPLAYS[-1]
        export BUILTINDISPLAY=$DISPLAYS[1]
    else
        export EXTERNDISPLAY=$DISPLAYS[1]
        export BUILTINDISPLAY=$DISPLAYS[1]
    fi
    custom_xrandr
    unset DISPLAYS
}

displays
