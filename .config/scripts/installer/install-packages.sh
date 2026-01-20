#!/usr/bin/env bash

echo "Removing some packages:"
sudo dnf remove \
volumeicon \
Thunar \
-y

echo "Updating system:"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y && sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1 -y
sudo dnf copr enable alternateved/i3status-rust -y
sudo dnf copr enable alternateved/eza -y
sudo dnf copr enable tokariew/i3lock-color
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
i3lock-color \
gcc \
clang \
go \
cmake \
curl \
stow \
python3 \
meson \
musl-devel \
make \
fuse \
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
nemo \
rofi \
blueman \
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


echo "Cloning directories & installing various programs:"
mkdir $HOME/JohWQ-i3-dotfiles-install && cd $HOME/JohWQ-i3-dotfiles-install

go install github.com/natsukagami/mpd-mpris/cmd/mpd-mpris@latest

cd $HOME

sudo mv $HOME/go/bin/mpd-mpris /usr/local/bin/

sleep 1 && reset

cargo install resvg

cargo install --force --git https://github.com/sxyazi/yazi.git yazi-build

cargo install rmpc --locked

sleep 1 && reset

cd $HOME/JohWQ-i3-dotfiles-install

git clone https://github.com/yeyushengfan258/Polarnight-Cursors.git && cd Polarnight-Cursors
sudo ./install.sh

cd $HOME/JohWQ-i3-dotfiles-install

git clone https://github.com/svenstaro/rofi-calc.git && cd rofi-calc
meson setup build
meson compile -C build && cd build
sudo meson install

cd $HOME/JohWQ-i3-dotfiles-install

git clone https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser && cd xdg-desktop-portal-termfilechooser
meson build
sudo ninja -C build install
sudo mv /usr/local/share/xdg-desktop-portal/portals/termfilechooser.portal /usr/share/xdg-desktop-portal/portals/

cd $HOME/JohWQ-i3-dotfiles-install

git clone https://github.com/boydaihungst/org.freedesktop.FileManager1.common && cd org.freedesktop.FileManager1.common
meson setup build --reconfigure
sudo ninja -C build install

cd $HOME/JohWQ-i3-dotfiles-install

mkdir -p $HOME/.local/share/fonts
git clone https://github.com/adi1090x/rofi.git && cd rofi
cp -rf fonts/* "$HOME/.local/share/fonts"

cd $HOME/JohWQ-i3-dotfiles-install

sudo ln -s ~/.cargo/bin/ya /usr/local/bin/
sudo ln -s ~/.cargo/bin/yazi /usr/local/bin/

wget -qO- https://git.io/papirus-icon-theme-install | sh

wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip && unzip CascadiaCode.zip -d CascadiaCode && find CascadiaCode -type f ! -name 'CaskaydiaCoveNerdFont-Regular.ttf' -delete && sudo mv CascadiaCode /usr/share/fonts/

wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && chmod +x greenclip && sudo mv greenclip /usr/local/bin/

curl https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer > pulsemixer && chmod +x pulsemixer && sudo mv pulsemixer /usr/local/bin/

cd $HOME
sudo rm -rf $HOME/go/
sudo rm -rf $HOME/JohWQ-i3-dotfiles-install

sudo rm -rf $HOME/.config/volumeicon
sudo rm -rf $HOME/.config/azote

sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
