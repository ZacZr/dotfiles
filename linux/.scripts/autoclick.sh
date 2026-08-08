#!/bin/bash
LOCKFILE="/tmp/autoclick.lock"

if [ -f "$LOCKFILE" ]; then
    rm "$LOCKFILE"
    notify-send -u "low" "Autoclick stopped."
    exit 0
fi

touch "$LOCKFILE"
notify-send -u "low" "Autoclick started."

while [ -f "$LOCKFILE" ]; do
    ydotool click --next-delay 2 0xC0
    # sleep 10
done

# DELAY=10.0
# 
# while [ -f "$LOCKFILE" ]; do
#     ydotool mousemove --absolute -x 2000 -y 500
#     sleep 0.1
#     ydotool mousemove --absolute -x 2010 -y 500
#     sleep 0.1
#     ydotool click 0xC0
# 
#     ydotool mousemove --absolute -x 2000 -y 600
#     sleep 0.1
#     ydotool click 0xC0
# 
#     sleep "$DELAY"
# done
