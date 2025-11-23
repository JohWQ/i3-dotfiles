#!/usr/bin/env sh

pactl_volume_step=1
pactl_max_volume=115
pactl_notification_timeout=1000
playerctl_notification_timeout=1000

function pactl_get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

function playerctl_get_volume {
    playerctl volume | awk '{printf "%.0f\n", $1 * 100}'
}

# Displays a volume notification
function pactl_show_volume_notif {
    pactl_volume=$(pactl_get_volume)
    pactl_notification_timeout=3000

    # Check if the volume is not empty or null
    if [ -n "$pactl_volume" ]; then
        notify-send -t "$pactl_notification_timeout" -h string:x-dunst-stack-tag:volume_notif -h int:value:"$pactl_volume" -i "$pactl_volume_icon" "Master: $pactl_volume%"
    fi
}

function playerctl_show_volume_notif {
    playerctl_volume=$(playerctl_get_volume)
    playerctl_notification_timeout=3000

    # Check if the volume is not empty or null
    if [ -n "$playerctl_volume" ]; then
        notify-send -t "$playerctl_notification_timeout" -h string:x-dunst-stack-tag:volume_notif -h int:value:"$playerctl_volume" -i "$playerctl_volume_icon" "Media: $playerctl_volume%"
    fi
}

case $1 in
    pactl_volume_up)
        # Unmutes and increases volume, then displays the notification
        pactl set-sink-mute @DEFAULT_SINK@ 0

        pactl_volume=$(pactl_get_volume)
        if [ $(( pactl_volume + pactl_volume_step )) -gt "$pactl_max_volume" ]; then
            pactl set-sink-volume @DEFAULT_SINK@ "$pactl_max_volume%"
        else
            pactl set-sink-volume @DEFAULT_SINK@ "+$pactl_volume_step%"
        fi
        pactl_show_volume_notif
        ;;
    
    pactl_volume_down)
        # Decreases volume and displays the notification
        pactl set-sink-volume @DEFAULT_SINK@ "-$pactl_volume_step%"
        pactl_show_volume_notif
        ;;
    
    pactl_volume_full)
        # Sets volume to full
        pactl set-sink-volume @DEFAULT_SINK@ 100%
        pactl_show_volume_notif
        ;;
    
    pactl_volume_7)
        # Sets volume to 60%
        pactl set-sink-volume @DEFAULT_SINK@ 60%
        pactl_show_volume_notif
        ;;
    
    pactl_volume_3)
        # Sets volume to 30%
        pactl set-sink-volume @DEFAULT_SINK@ 30%
        pactl_show_volume_notif
        ;;
    
    pactl_volume_mute)
        # Toggles mute
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        pactl_show_volume_notif
        ;;
    
    playerctl_volume_up)
        # Unmutes and increases volume, then displays the notification
        playerctl volume 0.01+
        playerctl_show_volume_notif
        playerctl_volume=$(playerctl_get_volume)
        if [ "$playerctl_volume" -eq 6 ]; then
            playerctl volume 0.07
        elif [ "$playerctl_volume" -eq 57 ]; then
            playerctl volume 0.59
        fi
        ;;
    
    playerctl_volume_down)
        # Decreases volume and displays the notification
        playerctl volume 0.01-
        playerctl_show_volume_notif
        ;;
    
    playerctl_volume_full)
        # Sets volume to full
        playerctl volume 1
        playerctl_show_volume_notif
        ;;
    
    playerctl_volume_7)
        # Sets volume to 60%
        playerctl volume 0.6
        playerctl_show_volume_notif
        ;;
    
    playerctl_volume_3)
        # Sets volume to 30%
        playerctl volume 0.3
        playerctl_show_volume_notif
        ;;
    
    playerctl_volume_mute)
        # Mutes the player
        playerctl volume 0
        playerctl_show_volume_notif
        ;;
    
    *)
        echo "Invalid command."
        ;;
esac
