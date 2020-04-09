#!/bin/zsh

DOTFILES=$HOME/.dotfiles
killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr"; then
    for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$monitor polybar -c $DOTFILES/i3/polybar/config --reload fjovell &
    done
else
    polybar -c $DOTFILES/i3/polybar/config --reload fjovell &
fi
