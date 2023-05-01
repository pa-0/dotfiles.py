#!/usr/bin/sh

DOTFILES="$HOME/.config/dotfiles"

# Enable display
displays() {
    [ "$(command -v xrandr)" ] && "$DOTFILES/bin/initial_screen.sh"
}

# Redshift
nightlight() {
    [ "$(command -v redshift)" ] && redshift -c "$DOTFILES/redshift/redshift.conf" &
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

passsword_prompt_ui() {
    [ "$(command -v lxpolkit)" ] && lxpolkit &
}

main() {
    displays
    passsword_prompt_ui
    nightlight
    notify
    background
    lightning
}

main
