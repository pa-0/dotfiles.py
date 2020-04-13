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

# Keyboard stuff
keyboards () {
    [ "$(command -v setxkbmap)" ] && \
        setxkbmap -layout "us,es" -option "grp:alt_shift_toggle" -option "caps:escape"
}

# background
background () {
    [ "$(command -v feh)" ] && feh --bg-scale "$DOTFILES/wallpaper/wallpaper.jpg"
}

main () {
    screens
    nightlight
    notify
    Keyboard
    background
}

main
