#!/usr/bin/env sh

current_output=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).output')
if [ "$current_output" = "DP-2" ]; then
    ~/.config/i3/scripts/new-workspace-monitor1.py
elif [ "$current_output" = "DP-4" ]; then
    ~/.config/i3/scripts/new-workspace-monitor2.py
fi
