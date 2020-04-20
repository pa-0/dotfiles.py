#!/usr/bin/sh

# A set of stuff to launch upon i3 start
export DOTFILES=$HOME/.dotfiles

# Redshift
nightlight () {
    [ "$(command -v redshift)" ] && redshift &
}

# Dunst
notify () {
    [ "$(command -v dunst)" ] && dunst -config "$DOTFILES/i3/dunst/dunstrc" &
}

# background
background () {
    [ "$(command -v feh)" ] && feh --bg-scale "$DOTFILES/wallpaper/wallpaper.jpg"
}

main () {
    screens
    nightlight
    notify
    background
}

main
