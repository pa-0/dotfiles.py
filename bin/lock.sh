#!/usr/bin/sh

# Lock the screen using i3lock-color (https://github.com/Raymo111/i3lock-color)
# The script will not do anything if it's not running in i3
# The theme colors are part of the Nord theme (https://www.nordtheme.com/)

lock_i3_session ()
(
    DOTFILES=$HOME/.dotfiles

    is_i3_lock_color=$(i3lock --version 2>&1 | grep -oP 'version \K[0-9.c]+ ')
    if [ "$is_i3_lock_color" ]
    then
        # i3lock COLOR Options
        B="#2E3440"  # blank
        C="#4C566A"  # clear ish
        D="#5E81AC"  # default
        T="#ECEFF4"  # text
        W="#BF616A"  # wrong
        V="#B48EAD"  # verifying

        I3LOCK_OPTS="
        --centered
        --screen=1
        --pass-media-keys
        --insidevercolor=$C
        --ringvercolor=$V
        --insidewrongcolor=$C
        --ringwrongcolor=$W
        --insidecolor=$B
        --ringcolor=$D
        --linecolor=$B
        --separatorcolor=$D
        --verifcolor=$T
        --wrongcolor=$T
        --timecolor=$T
        --datecolor=$T
        --layoutcolor=$T
        --keyhlcolor=$W
        --bshlcolor=$W"
    else
        I3LOCK_OPTS="--tiling"
    fi

    if [ "$(command -v i3lock)" ]
    then
        i3lock \
            --nofork \
            --show-failed-attempts \
            --ignore-empty-password \
            --color=2e3440 \
            --image="$DOTFILES/wallpaper/lock_wallpaper.png" \
            $I3LOCK_OPTS
            else
                i3-nagbar -t warning -m "Cannot find i3lock! I refuse to lock the screen..."
    fi
)

lock ()
{
    if [ "$XDG_SESSION_DESKTOP" = "i3" ]
    then
        lock_i3_session
    fi
}

lock "$@"
