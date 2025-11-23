#!/usr/bin/env bash

mv $HOME/.bashrc{,.bak}
mv $HOME/.gtkrc-2.0{,.bak}
mv $HOME/.profile{,.bak}
mv $HOME/.xprofile{,.bak}
mv $HOME/.Xresources{,.bak}
mv $HOME/.zshrc{,.bak}
mv $HOME/.tmux/{,.bak}
mv $HOME/xdg-desktop-portal-termfilechooser/{,.bak}

mv $HOME/.config/pulsemixer.cfg{,.bak}
mv $HOME/.config/alacritty/{,.bak}
mv $HOME/.config/betterlockscreen/{,.bak}
mv $HOME/.config/dunst/{,.bak}
mv $HOME/.config/gtk-3.0/{,.bak}
mv $HOME/.config/gtk-4.0/{,.bak}
mv $HOME/.config/i3/{,.bak}
mv $HOME/.config/i3status-rust/{,.bak}
mv $HOME/.config/nvim/{,.bak}
mv $HOME/.config/org.freedesktop.FileManager1.common/{,.bak}
mv $HOME/.config/picom/{,.bak}
mv $HOME/.config/scripts/{,.bak}
mv $HOME/.config/tmux/{,.bak}
mv $HOME/.config/xdg-desktop-portal/{,.bak}
mv $HOME/.config/yazi/{,.bak}

cd $HOME/i3-dotfiles
stow .

mv $HOME/.zshrc-sample $HOME/.zshrc

mv $HOME/.config/i3/config-sample $HOME/.config/i3/config
mv $HOME/.config/yazi/init-sample.lua $HOME/.config/yazi/init.lua
mv $HOME/.config/yazi/theme-sample.toml $HOME/.config/yazi/theme.toml

sleep 1 && reset
