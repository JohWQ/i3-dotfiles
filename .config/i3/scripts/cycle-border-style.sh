#!/usr/bin/env sh

# Get the current border style of the first window
CURRENT_BORDER=$(i3-msg -t get_tree | jq -r '.. | select(.focused? == true) | .border')

# Define the border styles
BORDER_1="pixel"
BORDER_2="normal"
BORDER_3="none"

# Cycle through the border styles
case $CURRENT_BORDER in
    "$BORDER_1")
        # Set all windows to normal
        i3-msg '[class=".*"] border normal'
        notify-send -t 1200 "Border Style" "Windows with titlebar"
        ;;
    "$BORDER_2")
        # Set all windows to none
        i3-msg '[class=".*"] border none'
        notify-send -t 1200 "Border Style" "No borders"
        ;;
    "$BORDER_3")
        # Set all windows to pixel 3
        i3-msg '[class=".*"] border pixel 3'
        notify-send -t 1200 "Border Style" "Default borders"
        ;;
    *)
        # Default case: set all windows to pixel 3
        i3-msg '[class=".*"] border pixel 3'
        ;;
esac

