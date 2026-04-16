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
done
