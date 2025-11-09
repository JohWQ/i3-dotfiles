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
export SHELL='/usr/local/bin/zsh'
export TERMINAL='alacritty'
export BROWSER='firefox'
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

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
-E "/home/jw/.local/state/yazi/packages"
-E "/mnt/4TB/JW/div/games/ludusavi-backup"
-E "JW/div/games/ludusavi-backup"'
