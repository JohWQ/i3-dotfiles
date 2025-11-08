#!/usr/bin/env bash
playerctl pause
xrandr --output DP-4 --off
i3lock -t -i ~/Pictures/img103.png && sleep 1
systemctl suspend; sleep 5; sleep 5; amixer set Master unmute; xrandr --output DP-2 --primary --mode 1920x1080 --rate 144.00 --pos 0x420 --output DP-4 --mode 1920x1080 --rate 144.00 --pos 1920x0 --rotate left
