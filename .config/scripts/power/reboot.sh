#!/bin/bash
playerctl pause
xrandr --output DP-4 --off
#umount /media/NTFSHDD4TB
pkill baobab
pkill mpd
pkill dunst
sleep 1
systemctl poweroff
