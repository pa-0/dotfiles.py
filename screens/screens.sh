#!/usr/bin/bash

# shellcheck disable=SC1090
source "$HOME/.zshenv"

launch_rofi ()
{
    rofi -dmenu -lines 4
}
screens ()
{
    mode=$(launch_rofi < "$DOTFILES/screens/modes" | grep -oP ".*- \K.+") && \
        "$DOTFILES/screens/$mode.sh" && \
        i3-msg restart
}

screens "$@"
