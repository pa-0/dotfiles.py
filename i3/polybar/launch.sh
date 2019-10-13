#!/bin/zsh

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar fjovell >> /tmp/polybar.log 2>&1 &
