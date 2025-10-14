#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-1"
theme='style-1'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=' Shutdown'
reboot=' Reboot'
lock=' Lock'
suspend=' Suspend'
logout=' Exit'
yes=' Yes'
no=' No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			~/.config/scripts/power/poweroff.sh
		elif [[ $1 == '--reboot' ]]; then
			~/.config/scripts/power/reboot.sh
		elif [[ $1 == '--suspend' ]]; then
			~/.config/scripts/power/suspend.sh
		elif [[ $1 == '--logout' ]]; then
			~/.config/scripts/power/exit.sh
		fi
	else
		exit 0
	fi
}

####run_cmd() {
####	selected="$(confirm_exit)"
####	if [[ "$selected" == "$yes" ]]; then
####		if [[ $1 == '--shutdown' ]]; then
####			sudo umount -f /media/WINDOWS
####			xrandr --output DP-4 --off
####			playerctl pause
####			systemctl poweroff
####		elif [[ $1 == '--reboot' ]]; then
####			sudo umount -f /media/WINDOWS
####			xrandr --output DP-4 --off
####			playerctl pause
####			systemctl reboot
####		elif [[ $1 == '--suspend' ]]; then
####			sudo umount -f /media/WINDOWS
####			xrandr --output DP-4 --off
####			playerctl pause
####			i3lock -t -i ~/Pictures/img103.png && sleep 1
####			systemctl suspend; sleep 5; sleep 5; amixer set Master unmute; xrandr --output DP-2 --primary --mode 1920x1080 --rate 144.00 --pos 0x420 --output DP-4 --mode 1920x1080 --rate 144.00 --pos 1920x0 --rotate left
####		elif [[ $1 == '--logout' ]]; then
####			sudo umount -f /media/WINDOWS
####			i3-msg exit
####		fi
####	else
####		exit 0
####	fi
####}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		~/.config/scripts/power/lock.sh
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
