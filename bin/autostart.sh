#!/usr/bin/sh

DOTFILES=$HOME/.dotfiles

# Enable display
displays () {
    xrandr --auto
}

# Redshift
nightlight () {
    [ "$(command -v redshift)" ] && redshift &
}

# Dunst
notify () {
    [ "$(command -v dunst)" ] && dunst -config "$DOTFILES/dunst/dunstrc" &
}

# background
background () {
    [ "$(command -v feh)" ] && feh --bg-fill "$DOTFILES/wallpaper/wallpaper.jpg"
}

main () {
    displays
    nightlight
    notify
    background
}

main
