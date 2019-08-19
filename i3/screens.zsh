#!/bin/zsh

if [[ $EXTERNDISPLAY != $BUILTINDISPLAY ]]; then
    xrandr --auto && \
        xrandr --output $EXTERNDISPLAY --primary --right-of $BUILTINDISPLAY \
               --output $BUILTINDISPLAY
    echo "Configuring $EXTERNDISPLAY and $BUILTINDISPLAY display setup"
else
    xrandr --auto
    echo "Configuring auto"
fi
