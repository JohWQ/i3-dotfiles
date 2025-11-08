#!/usr/bin/env bash

# File to store the current state
STATE_FILE="/tmp/display_toggle_wacom_state"

# Check if the state file exists
if [ -f "$STATE_FILE" ]; then
    # Read the current state
    STATE=$(cat "$STATE_FILE")
else
    # Default to "all" if the state file does not exist
    STATE="all"
fi

# Toggle the state
if [ "$STATE" == "all" ]; then
    xinput map-to-output 17 DP-2
    notify-send -t 2000 "Area: primary"
    echo "DP-2" > "$STATE_FILE"
else
    xinput map-to-output 17 all
    notify-send -t 2000 "Area: all"
    echo "all" > "$STATE_FILE"
fi
