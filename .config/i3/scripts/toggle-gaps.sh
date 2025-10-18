#!/usr/bin/env sh

# Define a temporary file to store the bar state
STATE_FILE="/tmp/i3_gaps_state"

# Check if the state file exists; if not, create it and set the initial state to "enabled"
if [ ! -f "$STATE_FILE" ]; then
    echo "enabled" > "$STATE_FILE"
fi

# Read the current state from the file
CURRENT_STATE=$(cat "$STATE_FILE")

# Toggle the bar mode
if [ "$CURRENT_STATE" == "enabled" ]; then
    i3-msg "gaps inner all set 0"
    echo "disabled" > "$STATE_FILE"
    notify-send -t 1200 "i3-gaps" "disabled"
else
    i3-msg "gaps inner all set 8"
    echo "enabled" > "$STATE_FILE"
    notify-send -t 1200 "i3-gaps" "enabled"
fi
