#!/usr/bin/sh

DOTFILES="$HOME/.config/dotfiles"

# Launch polybar
start_polybar() {
    # Do not launch polybar on qtile
    if [ "$(command -v polybar)" ] && [ "$XDG_SESSION_DESKTOP" != "qtile" ]; then
        killall -wq polybar
        for monitor in $(polybar --list-monitors | cut -d":" -f1); do
            MONITOR=$monitor polybar -c "$DOTFILES/polybar/config" main &
        done
    fi
}

# Keyboard stuff
keyboards() {
    [ "$(command -v setxkbmap)" ] &&
        setxkbmap -layout "us,es" -option "grp:alt_space_toggle" -option "caps:escape"
}

main() {
    start_polybar
    keyboards
}

main
