#!/usr/bin/sh

DOTFILES=$HOME/.config/dotfiles

# Enable display
displays () {
    [ "$(command -v xrandr)" ] && "$DOTFILES/screens/rotated.sh"
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
    [ "$(command -v feh)" ] && feh --bg-scale "$DOTFILES/wallpaper/wallpaper.png"
}

# ckb-next
lightning () {
    [ "$(command -v ckb-next)" ] && ckb-next --background
}

main () {
    displays
    nightlight
    notify
    background
    lightning
}

main
