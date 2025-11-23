#!/usr/bin/env bash

$HOME/i3-dotfiles/.config/scripts/installer/packages.sh
echo "Packages installed, moving configuration files..."

$HOME/i3-dotfiles/.config/scripts/installer/dotfiles.sh
echo "Configuration files installed"

echo "Clearing font cache:"
fc-cache -fv

echo
echo "Script complete, Congratulations"
echo
echo "It is recommended that you reboot your system."
echo "Do you want to reboot now? (y/n)"
read -r answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Rebooting now..."
    sudo reboot  # Requires sudo privileges
else
    echo "No reboot will be performed."
fi
