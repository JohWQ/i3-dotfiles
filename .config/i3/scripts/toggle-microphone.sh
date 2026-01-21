#!/usr/bin/env sh

# Toggle microphone mute state
pactl set-source-mute 0 toggle

# Get the current mute state
MUTE_STATE=$(pactl list sources | grep 'Mute' | sed -n '2p' | awk '{print $2}' | head -n 1)

# Send notification based on mute state
if [ "$MUTE_STATE" = "yes" ]; then
    notify-send -t 1800 "Microphone status" "Microphone is muted."
else
    notify-send -t 1800 "Microphone status" "Microphone is unmuted."
fi
