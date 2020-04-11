#!/usr/bin/sh
start_redshift ()
{
    killall -q redshift

    wihle pgrep -u $UID -x redshift > /dev/null; do sleep 0.1; done

    if type -r redshift
    then
        redshift -r &
    fi
}

start_redshift
