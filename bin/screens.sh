#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

launch-rofi() {
    rofi \
        -dmenu \
        -p "Select a screen layout" \
        -sep "|" \
        -theme powermenu
}

dual-rotated() {
    source "$DOTFILES/bin/initial_screen.sh"
}

main-screen() {
    xrandr \
        --output "$MAIN_SCREEN" \
        --primary \
        --mode 2560x1440 \
        --rate 120.0 \
        --rotate normal \
        --output "$SECONDARY_SCREEN" \
        --off
}

vertical-only() {
    xrandr \
        --output "$MAIN_SCREEN" \
        --off \
        --output "$SECONDARY_SCREEN" \
        --mode 2560x1440 \
        --pos 0x0 \
        --rotate left \
        --rate 60
}

screens() {
    mode=$(echo "dual|main|vertical" | launch-rofi)

    case "$mode" in
    "dual")
        dual-rotated
        ;;
    "main")
        main-screen
        ;;
    "vertical")
        vertical-only
        ;;
    *)
        notify-send -a "Screens" "Atenció!" "Algo ha passat i no he pogut posar les pantalles com vols :("
        exit 1
        ;;
    esac

    i3-msg restart
}

screens "$@"
