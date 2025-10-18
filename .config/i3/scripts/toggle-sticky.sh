#!/usr/bin/env sh

# Define a temporary file to store the bar state
STATE_FILE="/tmp/i3_sticky_state"

# Check if the state file exists; if not, create it and set the initial state to "enabled"
if [ ! -f "$STATE_FILE" ]; then
    echo "disabled" > "$STATE_FILE"
fi

CONTAINER_CLASS=$(i3-msg -t get_tree | jq -r '.. | objects | select(.focused == true) | .window_properties.class // empty')

# Read the current state from the file
CURRENT_STATE=$(cat "$STATE_FILE")

# Toggle the sticky mode
if [ "$CURRENT_STATE" == "enabled" ]; then
    i3-msg "sticky disable"
    echo "disabled" > "$STATE_FILE"
    notify-send -t 1800 "Window stick" "disabled for $CONTAINER_CLASS"
else
    i3-msg "sticky enable"
    echo "enabled" > "$STATE_FILE"
    notify-send -t 1800 "Window Stick" "enabled for $CONTAINER_CLASS"
fi
