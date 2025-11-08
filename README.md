# Functional i3wm configuration on Fedora 42.

## Install Packages available in repos:

It is recommended that you have set up RPMFusion to get access to more packages.

```
sudo dnf group install multimedia
sudo dnf group install "development-tools"
sudo dnf install gcc meson autoconf automake cairo-devel fontconfig libev-devel libjpeg-turbo-devel libXinerama libxkbcommon-devel libxkbcommon-x11-devel libXrandr pam-devel pkgconf xcb-util-image-devel xcb-util-xrm-devel clang openssl openssl-devel lm_sensors lm_sensors-devel notmuch-devel pipewire-libs pandoc xclip xsel jq make git python3 picom playerctl stow rofi rofi-devel libtool qalculate neovim Thunar st alacritty dunst feh btop fzf ImageMagick xdpyinfo xrdb 
```

```
# Optional:
sudo dnf install gio fooyin gimp flameshot tesseract ntfs-3g obs-studio vesktop marktext
```

Install various stuff:

```
cd ~ && git clone https://github.com/Raymo111/i3lock-color.git && cd i3lock-color && sudo ./install-i3lock-color.sh
cd ~ && wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system
rm -r ~/i3lock-color
cd ~/Downloads && curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
| grep "CascadiaCode.zip" \
| cut -d '"' -f 4 \
| xargs -n 1 curl -LO
cd ~/Downloads && curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
| grep "LiberationMono.zip" \
| cut -d '"' -f 4 \
| xargs -n 1 curl -LO
unzip CascadiaCode.zip -d CascadiaCode && sudo mkdir -p /usr/share/fonts/CascadiaCode && sudo mv ./CascadiaCode/CaskaydiaCoveNerdFont-Regular.ttf /usr/share/fonts/CascadiaCode/
sudo unzip LiberationMono.zip -d /usr/share/fonts/LiberationMono
fc-cache -fv
rm ~/Downloads/LiberationMono.zip
rm -r ~/Downloads/LiberationMono
rm ~/Downloads/CascadiaCode.zip
rm -r ~/Downloads/CascadiaCode
cd ~/Downloads && curl https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer > pulsemixer && chmod +x ./pulsemixer && sudo mv ./pulsemixer /usr/local/bin/
cd ~/Downloads && git clone https://github.com/svenstaro/rofi-calc.git
cd rofi-calc/
meson setup build
meson compile -C build/
sudo meson install
cd ~/Downloads && wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && sudo mv ./greenclip /usr/local/bin/
```

## Installing [i3status-rs](https://github.com/greshake/i3status-rust)

Make sure to have the required packages from the first code block installed.

- Install [rustup](https://rustup.rs/) with its installation command.

- Configure cargo:

```
mkdir -p ~/.cargo
echo '[build]
rustflags = ["-C", "target-feature=-crt-static"]' > ~/.cargo/config.toml
```

- Build and Install from Source:

```
# Run as normal user
cd ~/Downloads && git clone https://github.com/greshake/i3status-rust
cd i3status-rust
cargo install --path . --locked
./install.sh
```

## Dark mode in applications

Modify the `i3.desktop` xsession file:

First create a backup:

```
sudo cp /usr/share/xsessions/i3.desktop /usr/share/xsessions/i3.desktop.bak 
```

Then modify the `i3.desktop` file by changing the `Exec` line with the following:

```
Exec=sh -c 'env QT_QPA_PLATFORMTHEME=gtk3 i3'
```

## TODO:
- Create a personal Nvim configuration
- Set per-directory viewing configuration in yazi
- Have a more consistent theme (instead of having a different dark theme for GTK and QT applications) 
