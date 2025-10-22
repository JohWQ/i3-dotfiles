#!/bin/bash
sudo umount -f /media/WINDOWS
sudo umount -f /media/SSD1TB
sudo umount -f /media/NTFSHDD4TB
sudo umount -f /media/EXT4HDD4TB
sudo umount -f /mnt/4TB
xrandr --output DP-4 --off
#systemctl stop --user xdg-desktop-portal-gtk.service
pkill baobab
pkill dunst
pkill alacritty
playerctl pause
systemctl reboot
