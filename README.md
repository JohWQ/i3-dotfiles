# Functional i3wm configuration on Fedora 42.

## Installation script
Follow the instructions of any prompt that might appear on the screen.
### Install packages:
```
sudo dnf update && sudo dnf install git
mv $HOME/i3-dotfiles{,.bak}
git clone https://github.com/JohWQ/i3-dotfiles.git && cd i3-dotfiles/.config/scripts/installer
./install-packages.sh
```
### Install dotfiles:
Note:
- on F43:
  -  the font in alacritty might be broken.
  -  Picom might break things.
```
cd $HOME/i3-dotfiles/.config/scripts/installer
./install-dotfiles.sh
```


## TODO:
- [] Create a better personal Nvim configuration
- [x] Set per-directory viewing configuration in yazi
- [ ] Have a more consistent theme (instead of having a different dark theme for GTK and QT applications)
- [x] Create a proper installation script
- [ ] Create configuration for rmpc
