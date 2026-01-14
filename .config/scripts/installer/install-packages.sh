#!/usr/bin/env bash

echo "Updating system:"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y && sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1 -y
sudo dnf copr enable alternateved/i3status-rust -y
sudo dnf copr enable dturner/eza -y
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
eza \
gcc \
clang \
go \
cmake \
curl \
stow \
python3 \
meson \
make \
fuse3-devel \
fuse-libs \
autoconf \
automake \
gtk3-devel \
gtk4-devel \
dbus-devel \
jq \
fontconfig \
liberation-mono-fonts \
fontawesome-fonts-all \
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
libtool \
picom \
playerctl \
7zip \
dnf-utils \
cifs-utils-devel \
rofi \
rofi-devel \
tldr \
wireguard-tools \
qalculate \
fastfetch \
vim \
neovim \
mpd \
mpc \
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
syncthing \
tesseract \
obs-studio \
-y

sudo dnf remove \
volumeicon \
-y


echo "Cloning directories & installing various programs:"
mkdir $HOME/JohWQ-i3-dotfiles-install && cd $HOME/JohWQ-i3-dotfiles-install

go install github.com/natsukagami/mpd-mpris/cmd/mpd-mpris@latest

cd $HOME

sudo mv $HOME/go/bin/mpd-mpris /usr/local/bin/

sleep 1 && reset

cargo install resvg

cargo install --force --git https://github.com/sxyazi/yazi.git yazi-build

cargo install rmpc --locked

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

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip && unzip CascadiaCode.zip -d CascadiaCode && find CascadiaCode -type f ! -name 'CaskaydiaCoveNerdFont-Regular.ttf' -delete && sudo mv CascadiaCode /usr/share/fonts/

wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && chmod +x greenclip && sudo mv greenclip /usr/local/bin/

curl https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer > pulsemixer && chmod +x pulsemixer && sudo mv pulsemixer /usr/local/bin/

cd $HOME
sudo rm -rf $HOME/go/
sudo rm -rf $HOME/JohWQ-i3-dotfiles-install

sudo rm -rf $HOME/.config/volumeicon

sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
