# Functional i3wm configuration on Fedora 42.

## Installation script
Follow the instructions of any prompt that might appear on the screen.
```
sudo dnf update && sudo dnf install git
mv $HOME/i3-dotfiles{,.bak}
git clone https://github.com/JohWQ/i3-dotfiles.git && cd i3-dotfiles/.config/scripts/installer
./install.sh # or run with elevated priviliges: sudo ./install.sh
```

## TODO:
- [ ] Create a better personal Nvim configuration
- [x] Set per-directory viewing configuration in yazi
- [ ] Have a more consistent theme (instead of having a different dark theme for GTK and QT applications)
- [ ] Create a proper installation script
- [ ] Create configuration for rmpc
