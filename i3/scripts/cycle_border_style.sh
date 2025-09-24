#!/bin/bash

# Get the current border style of the first window
CURRENT_BORDER=$(i3-msg -t get_tree | jq -r '.. | select(.focused? == true) | .border')

# Define the border styles
BORDER_PIXEL="pixel"
BORDER_NORMAL="normal"
BORDER_NONE="none"

# Cycle through the border styles
case $CURRENT_BORDER in
    "$BORDER_PIXEL")
        # Set all windows to normal
        i3-msg '[class=".*"] border normal'
        ;;
    "$BORDER_NORMAL")
        # Set all windows to none
        i3-msg '[class=".*"] border none'
        ;;
    "$BORDER_NONE")
        # Set all windows to pixel 4
        i3-msg '[class=".*"] border pixel 4'
        ;;
    *)
        # Default case: set all windows to pixel 4
        i3-msg '[class=".*"] border pixel 4'
        ;;
esac

