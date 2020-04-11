#!/usr/bin/sh

# A set of stuff to launch upon i3 start
export DOTFILES=$HOME/.dotfiles

# Reload screens
source $DOTFILES/i3/screens.sh
displays

# Launch polybar
source $DOTFILES/i3/polybar/launch.sh
launch_polybar

# Redshift
source $DOTFILES/i3/redshift/start_redshift.sh
start_redshift

# Dunst
killall -q dunst
dunst -config $DOTFILES/i3/dunst/dunstrc &

# Keyboard stuff
setxkbmap -layout "us,es" -option "grp:alt_shift_toggle" -option "caps:escape"

# background
feh --bg-scale $DOTFILES/wallpaper/wallpaper.jpg
