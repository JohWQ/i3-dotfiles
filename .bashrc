# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# PATHS:
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"
export TERMINAL='alacritty'
export SHELL='zsh'
export EDITOR='nvim'
export VISUAL='nvim'
export FZF_DEFAULT_COMMAND='fd -H -t f \
-E "/.snapshots" \
-E "/sys" \
-E "/usr/src" \
-E "/.cache" \
-E "/.terminfo" \
-E "/.mozilla" \
-E "/.rustup" \
-E ".snapshots" \
-E "/home/.snapshots" \
-E ".cache" \
-E "/home/jw/.cache" \
-E ".steam" \
-E "/home/jw/.steam" \
-E ".mozilla" \
-E "/home/jw/.mozilla" \
-E ".cargo/registry" \
-E "/home/jw/.cargo/registry" \
-E ".config/BraveSoftware" \
-E "/home/jw/.config/BraveSoftware" \
-E ".config/vesktop/sessionData" \
-E "/home/jw/.config/vesktop/sessionData" \
-E ".config/YouTube Music/Cache" \
-E "/home/jw/.config/YouTube Music/Cache" \
-E ".config/YouTube Music/Code Cache" \
-E "/home/jw/.config/YouTube Music/Code Cache" \
-E ".config/YouTube Music/Service Worker/" \
-E "/home/jw/.config/YouTube Music/Service Worker/" \
-E ".local/share/Steam/appcache" \
-E "/home/jw/.local/share/Steam/appcache" \
-E ".local/share/Steam/controller_base" \
-E "/home/jw/.local/share/Steam/controller_base" \
-E ".local/share/Steam/resource" \
-E "/home/jw/.local/share/Steam/resource" \
-E ".local/share/Steam/graphics" \
-E "/home/jw/.local/share/Steam/graphics" \
-E ".local/share/Steam/steamrt64" \
-E "/home/jw/.local/share/Steam/steamrt64" \
-E ".local/share/Steam/tenfoot" \
-E "/home/jw/.local/share/Steam/tenfoot" \
-E ".local/share/Steam/config/avatarcache/" \
-E "/home/jw/.local/share/Steam/config/avatarcache/" \
-E ".local/share/Steam/config/htmlcache" \
-E "/home/jw/.local/share/Steam/config/htmlcache/" \
-E ".local/share/Steam/ubuntu12_32" \
-E "/home/jw/.local/share/Steam/ubuntu12_32" \
-E ".local/share/Steam/ubuntu12_64" \
-E "/home/jw/.local/share/Steam/ubuntu12_64" \
-E ".local/share/Steam/public" \
-E "/home/jw/.local/share/Steam/public" \
-E ".local/share/Steam/steam" \
-E "/home/jw/.local/share/Steam/steam" \
-E ".local/share/Steam/steamui" \
-E "/home/jw/.local/share/Steam/steamui" \
-E ".local/share/Steam/friends" \
-E "/home/jw/.local/share/Steam/friends" \
-E ".local/share/nvim/lazy" \
-E "/home/jw/.local/share/nvim/lazy" \
-E ".local/share/nvim.bak" \
-E "/home/jw/.local/share/nvim.bak" \
-E ".local/share/Smart Code ltd" \
-E "/home/jw/.local/share/Smart Code ltd" \
-E ".local/state/yazi/packages" \
-E "/home/jw/.local/state/yazi/packages"'

#export TERMINAL='alacritty'
# #QT_STYLE_OVERRIDE=Adwaita-Dark
# 
# # --------------- custom_alias --------------- #
# alias fdfind='fd --hidden'
# alias isactive='pgrep -l -f '
# alias showfont='fc-list : family | grep -i '
# alias vim='nvim'
# alias bashrcvim='sudo nvim ~/.bashrc'
# alias basrhcvim='sudo nvim ~/.bashrc'
# alias sudo='sudo '
# alias suod='sudo'
# alias sudd='sudo'
# alias suoo='sudo'
# alias sud='sudo'
# alias cd..='cd ..'
# alias catt='head -n 1 '
# alias exity='exit'
# alias exti='exit'
# alias cls='clear'
# alias csl='clear'
# alias cøs='clear'
# alias cler='clear'
# alias clar='clear'
# alias clearr='clear'
# alias clera='clear'
# alias claer='clear'
# alias sl='ls'
# alias dir='ls'
# alias neofetch='clear; fastfetch'
# alias ipconfig='ifconfig'
# alias betterlockscreenconfig='nvim ~/.config/betterlockscreen/betterlockscreenrc'
# alias bashrcupdate='source ~/.bashrc'
# alias basrhcupdate='source ~/.bashrc'
# alias dnfi='sudo dnf install '
# alias dnfs='sudo dnf search '
# alias update='sudo dnf update'
# alias udpate='sudo dnf update'
# alias updtae='sudo dnf update'
# alias updaet='sudo dnf update'
# alias updta='sudo dnf update && sudo dnf upgrade'
# alias updeat='sudo dnf update && sudo dnf upgrade'
# alias instlal='install '
# alias dldir='cd ~/Downloads'
# alias docdir='cd ~/Documents'
# alias photodir='cd ~/Pictures'
# alias videodir='cd ~/Videos'
# alias desktopdir='cd ~/Videos'
# alias jw='cd ~'
# alias 4tb='cd /mnt/4TB'
# alias bootbios='systemctl reboot --firmware-setup'
# alias usefulcmd='awk "/#custom_alias/{found=1; next} found && /alias /{sub(/.*alias /, \"\"); sub(/=.*/, \"\"); print}" ~/.bashrc; echo; cat ~/cmd.txt'
# alias usefulcmdvim='vim ~/cmd.txt'
# alias todo='cat /mnt/4TB/JW/div/linux/todo.txt'
# alias todovim='nvim /mnt/4TB/JW/div/linux/todo.txt'
# alias learnvim='cat /mnt/4TB/learn-vim.txt'
# alias vimlearn='nvim /mnt/4TB/learn-vim.txt'
# alias i3config='nvim ~/.config/i3/config'
# alias i3statusconfig='sudo nvim /home/jw/.config/i3status-rust/config.toml'
# alias i3statusconfig1='sudo nvim /home/jw/.config/i3/i3status.conf'
# alias picomconfig='sudo nvim ~/.config/picom/picom.conf'
# alias picom='picom --daemon --config /home/jw/.config/picom/picom.conf'
# alias roficonfig='sudo nvim ~/.config/rofi/config.rasi'
# alias uefiupdate="echo 'sudo fwupdmgr update -y' | xclip -selection clipboard; echo -e '\e[31mCopied to clipboard. Run the following as root: sudo fwupdmgr update -y\e[0m'; sudo su"
