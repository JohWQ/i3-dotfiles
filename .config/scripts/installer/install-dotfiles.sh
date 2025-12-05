#!/usr/bin/env bash

mv $HOME/.bashrc $HOME/.bashrc.bak
mv $HOME/.gtkrc-2.0 $HOME/.gtkrc-2.0.bak
mv $HOME/.profile $HOME/.profile.bak
mv $HOME/.xprofile $HOME/.xprofile.bak
mv $HOME/.Xresources $HOME/.Xresources.bak
mv $HOME/.zshrc $HOME/.zshrc.bak
mv $HOME/.tmux $HOME/.tmux.bak
mv $HOME/xdg-desktop-portal-termfilechooser $HOME/xdg-desktop-portal-termfilechooser.bak

mv $HOME/.config/pulsemixer.cfg $HOME/.config/pulsemixer.cfg.bak
mv $HOME/.config/alacritty $HOME/.config/alacritty.bak
mv $HOME/.config/betterlockscreen $HOME/.config/betterlockscreen.bak
mv $HOME/.config/dunst $HOME/.config/dunst.bak
mv $HOME/.config/fastfetch $HOME/.config/fastfetch.bak
mv $HOME/.config/gtk-3.0 $HOME/.config/gtk-3.0.bak
mv $HOME/.config/gtk-4.0 $HOME/.config/gtk-4.0.bak
mv $HOME/.config/i3 $HOME/.config/i3.bak
mv $HOME/.config/i3status-rust $HOME/.config/i3status-rust.bak
mv $HOME/.config/mpd $HOME/.config/mpd.bak
mv $HOME/.config/nvim $HOME/.config/nvim.bak
mv $HOME/.config/org.freedesktop.FileManager1.common $HOME/.config/org.freedesktop.FileManager1.common.bak
mv $HOME/.config/picom $HOME/.config/picom.bak
mv $HOME/.config/rmpc $HOME/.config/rmpc.bak
mv $HOME/.config/scripts $HOME/.config/scripts.bak
mv $HOME/.config/tmux $HOME/.config/tmux.bak
mv $HOME/.config/xdg-desktop-portal $HOME/.config/xdg-desktop-portal.bak
mv $HOME/.config/yazi $HOME/.config/yazi.bak

mv $HOME/i3-dotfiles/.zshrc-sample $HOME/i3-dotfiles/.zshrc
mv $HOME/i3-dotfiles/.config/i3/scripts/new-workspace-sample.sh $HOME/i3-dotfiles/.config/i3/scripts/new-workspace.sh
mv $HOME/i3-dotfiles/.config/i3/modes-sample.conf $HOME/i3-dotfiles/.config/i3/modes.conf
mv $HOME/i3-dotfiles/.config/i3/config-sample $HOME/i3-dotfiles/.config/i3/config
mv $HOME/i3-dotfiles/.config/yazi/init-sample.lua $HOME/i3-dotfiles/.config/yazi/init.lua
mv $HOME/i3-dotfiles/.config/yazi/theme-sample.toml $HOME/i3-dotfiles/.config/yazi/theme.toml

cd $HOME/i3-dotfiles
stow .

fc-cache -fv

sleep 1 && reset

echo "It is recommended that you reboot after finishing the installation."
