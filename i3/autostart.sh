#!/usr/bin/sh

# A set of stuff to launch upon i3 start
export DOTFILES=$HOME/.dotfiles

# Reload screens
killall -wq enact
if [ "$(command -v "$HOME/.local/cargo/bin/enact")" ]
then
    enact --pos left --watch &
fi

# Launch polybar
killall -wq polybar

if [ "$(command -v xrandr)" ]
then
    for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$monitor polybar -c "$DOTFILES/i3/polybar/config" --reload fjovell &
    done
else
    polybar -c "$DOTFILES/i3/polybar/config" --reload fjovell &
fi

# Redshift
killall -wq redshift

if [ "$(command -v redshift)" ]
then
    redshift &
fi

# Dunst
killall -wq dunst

if [ "$(command -v dunst)" ]
then
    dunst -config "$DOTFILES/i3/dunst/dunstrc" &
fi

# Keyboard stuff
if [ "$(command -v setxkbmap)" ]
then
    setxkbmap -layout "us,es" -option "grp:alt_shift_toggle" -option "caps:escape"
fi

# background
if [ "$(command -v feh)" ]
then
    feh --bg-scale "$DOTFILES/wallpaper/wallpaper.jpg"
fi
