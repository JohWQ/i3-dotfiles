#!/usr/bin/env bash
playerctl pause
xrandr --output DP-4 --off
#pkill virt-manager
#pkill libvirtd
#pkill dnsmasq
#pkill qemu-system-x86
pkill alacritty
pkill st
pkill baobab
pkill mpd
pkill dunst
sleep 5
systemctl reboot
