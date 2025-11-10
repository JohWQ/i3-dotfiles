#!/usr/bin/env bash

echo "Enable RPMFusion:"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf copr enable alternateved/i3status-rust
sudo dnf update

echo "Installing packages:"
sudo dnf group install multimedia "development-tools"
sudo dnf install \
i3status-rust \
gcc \
clang \
python3 \
meson \
make \
autoconf \
automake \
gtk3-devel \
gtk4-devel \
jq \
fontconfig \
liberation-mono-fonts \
cascadia-code-nf-fonts \
libev-devel \
libjpeg-turbo-devel \
libXinerama \
libxkbcommon-devel \
libxkbcommon-x11-devel \
libXrandr \
pam-devel \
ImageMagick \
totem-video-thumbnailer \
ffmpegthumbnailer \
xdpyinfo \
pkgconf \
xcb-util-image-devel \
xcb-util-xrm-devel \
openssl \
openssl-devel \
lm_sensors \
lm_sensors-devel \
notmuch-devel \
pipewire-libs \
pandoc \
xclip \
xsel \
xset \
picom \
playerctl \
stow \
rofi \
rofi-devel \
libtool \
qalculate \
neovim \
st \
alacritty \
btop \
fzf \
gio \
flameshot \
tesseract \
obs-studio


echo "Installing various packages:"
cd $HOME
mkdir i3-dotfiles-install && cd i3-dotfiles-install
git clone https://github.com/Raymo111/i3lock-color.git && cd i3lock-color && sudo ./install-i3lock-color.sh
cd $HOME/i3-dotfiles-install
git clone https://github.com/yeyushengfan258/Polarnight-Cursors.git && cd Polarnight-Cursors
sudo ./install.sh
cd $HOME/i3-dotfiles-install
git clone https://github.com/svenstaro/rofi-calc.git && cd rofi-calc
meson setup build
meson compile -C build && cd build
sudo meson install
cd $HOME/i3-dotfiles-install
wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system
wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && sudo mv greenclip /usr/local/bin/
curl https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer > pulsemixer && chmod +x pulsemixer && sudo mv pulsemixer /usr/local/bin/
cd $HOME/i3-dotfiles-install
sudo rm -rf $HOME/i3-dotfiles-install/*


echo "Clearing font cache:"
fc-cache -fv


echo "Reboot to initialize all changes!"
