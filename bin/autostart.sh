#!/usr/bin/sh

DOTFILES=$HOME/.config/dotfiles

# Enable display
displays () {
    [ "$(command -v xrandr)" ] && "$DOTFILES/screens/main.sh"
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

# autolock
autolock () {
    [ "$(command -v xautolock)" ] && xautolock -time 3 -locker "$DOTFILES/bin/lock.sh" &
}

main () {
    displays
    nightlight
    notify
    background
    autolock
}

main
