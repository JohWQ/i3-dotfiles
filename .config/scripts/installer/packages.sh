#!/usr/bin/env bash

echo "Updating system:"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y && sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1 -y
sudo dnf copr enable alternateved/i3status-rust -y
sudo dnf update -y

# Rustup:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sleep 1 && reset
rustup update
# Packages from repos:
echo "Installing packages:"
sudo dnf group install multimedia "development-tools" -y
sudo dnf install \
i3status-rust \
gcc \
clang \
cmake \
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
inih-devel \
scdoc \
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
fd-find \
p7zip \
zoxide \
bat \
gio \
flameshot \
tesseract \
obs-studio -y


echo "Cloning directories & installing various programs:"
mkdir $HOME/JohWQ-i3-dotfiles-install && cd $HOME/JohWQ-i3-dotfiles-install

cargo install resvg

cargo install --force --git https://github.com/sxyazi/yazi.git yazi-build

git clone https://github.com/Raymo111/i3lock-color.git && cd i3lock-color && sudo ./install-i3lock-color.sh

cd $HOME/JohWQ-i3-dotfiles-install

git clone https://github.com/yeyushengfan258/Polarnight-Cursors.git && cd Polarnight-Cursors
sudo ./install.sh

cd $HOME/JohWQ-i3-dotfiles-install

git clone https://github.com/svenstaro/rofi-calc.git && cd rofi-calc
meson setup build
meson compile -C build && cd build
sudo meson install

cd $HOME/JohWQ-i3-dotfiles-install

git clone https://github.com/GermainZ/xdg-desktop-portal-termfilechooser.git && cd xdg-desktop-portal-termfilechooser
meson build && sudo ninja -C build install

cd $HOME/JohWQ-i3-dotfiles-install

git clone https://github.com/boydaihungst/org.freedesktop.FileManager1.common && cd org.freedesktop.FileManager1.common
meson setup build --reconfigure
sudo ninja -C build install

cd $HOME/JohWQ-i3-dotfiles-install

wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system

wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && sudo mv greenclip /usr/local/bin/

curl https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer > pulsemixer && chmod +x pulsemixer && sudo mv pulsemixer /usr/local/bin/

if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

cd $HOME
sudo rm -rf $HOME/JohWQ-i3-dotfiles-install
