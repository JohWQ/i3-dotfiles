#!/usr/bin/env sh

# File to store the current state
STATE_FILE="/tmp/i3_window_size_state"

# Read current state, or start from 0 if file doesn’t exist
if [[ -f "$STATE_FILE" ]]; then
    state=$(<"$STATE_FILE")
else
    state=0
fi

# Define the window size commands
case $state in
    0)
        i3-msg resize set 1050 700
        i3-msg move position center
        next_state=1
        ;;
    1)
        i3-msg resize set 850 900
        i3-msg move position center
        next_state=2
        ;;
    2)
        i3-msg resize set 1400 1000
        i3-msg move position center
        next_state=3
        ;;
    3)
        i3-msg resize set 1000 1500
        i3-msg move position center
        next_state=4
        ;;
    4)
        i3-msg resize set 600 400
        i3-msg move position center
        next_state=0
        ;;
esac

# Save the next state
echo "$next_state" > "$STATE_FILE"

