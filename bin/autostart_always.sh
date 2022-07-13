#!/usr/bin/sh

DOTFILES="$HOME/.config/dotfiles"

start_polybar() {
    # Do not launch polybar on qtile
    if [ "$(command -v polybar)" ] && [ "$XDG_SESSION_DESKTOP" != "qtile" ]; then
        killall -wq polybar
        for monitor in $(polybar --list-monitors | cut -d":" -f1); do
            MONITOR=$monitor polybar -c "$DOTFILES/polybar/config" main &
        done
    fi
}

keyboards() {
    [ "$(command -v setxkbmap)" ] &&
        setxkbmap -layout "us,es" -option "grp:alt_space_toggle" -option "caps:escape"
}

new_keyboards() {
    [ "$(command -v setxkbmap)" ] &&
        setxkbmap -layout "us"
}
main() {
    start_polybar
    new_keyboards
}

main
