#!/usr/bin/env zsh


# Terminate already running instances
killal -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch the bar!
polybar bar1&

echo "Bar launched!"
