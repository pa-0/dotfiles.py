#!/usr/bin/sh

DOTFILES="$HOME/.config/dotfiles"

# Enable display
displays() {
    [ "$(command -v xrandr)" ] && "$DOTFILES/bin/rotated.sh"
}

# Redshift
nightlight() {
    [ "$(command -v redshift)" ] && redshift -c $DOTFILES/redshift/redshift.conf &
}

# Dunst
notify() {
    [ "$(command -v dunst)" ] && dunst -config "$DOTFILES/dunst/dunstrc" &
}

# background
background() {
    if [ "$(command -v nitrogen)" ]; then
        nitrogen --restore
    elif [ "$(command -v feh)" ]; then
        feh --bg-fill "$DOTFILES/wallpaper/wallpaper.png"
    fi
}

# ckb-next
lightning() {
    [ "$(command -v ckb-next)" ] && ckb-next --background
}

main() {
    displays
    nightlight
    notify
    background
    lightning
}

main
