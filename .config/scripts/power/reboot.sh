#!/bin/bash
playerctl pause
xrandr --output DP-4 --off
sudo umount -f /media/WINDOWS
sudo umount -f /media/SSD1TB
sudo umount -f /media/NTFSHDD4TB
sudo umount -f /media/EXT4HDD4TB
sudo umount -f /mnt/4TB
#systemctl stop --user xdg-desktop-portal-gtk.service
#pkill baobab
pkill mpd
pkill dunst
pkill alacritty
sleep 1
sudo systemctl reboot
