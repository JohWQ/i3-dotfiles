# Functional i3wm configuration on Fedora 42.

## Installation script

```
git clone https://github.com/JohWQ/i3-dotfiles.git && cd i3-dotfiles/.config/scripts
./install.sh
```

### Installing [i3status-rs](https://github.com/greshake/i3status-rust)
### - Install [rustup](https://rustup.rs/) with its installation command.
### - Configure cargo
### ```
### mkdir -p ~/.cargo
### echo '[build]
### rustflags = ["-C", "target-feature=-crt-static"]' > ~/.cargo/config.toml
### ```
###
### - Build and Install from Source:
###
### ```
### # Run as normal user
### cd ~/Downloads && git clone https://github.com/greshake/i3status-rust
### cd i3status-rust
### cargo install --path . --locked
### ./install.sh
### ```
###
### ## Dark mode in applications
###
### Modify the `i3.desktop` xsession file:
###
### First create a backup:
###
### ```
### sudo cp /usr/share/xsessions/i3.desktop /usr/share/xsessions/i3.desktop.bak 
### ```
###
### Then modify the `i3.desktop` file by changing the `Exec` line with the following:
###
### ```
### Exec=sh -c 'env QT_QPA_PLATFORMTHEME=gtk3 i3'
### ```

## TODO:
- Create a better personal Nvim configuration
- Set per-directory viewing configuration in yazi
- Have a more consistent theme (instead of having a different dark theme for GTK and QT applications)
- Create a proper installation script
