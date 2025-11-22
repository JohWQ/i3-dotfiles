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

# CUSTOM PATHS:
export SHELL='/usr/local/bin/zsh'
export TERMINAL='alacritty'
export BROWSER='firefox'
export EDITOR='nvim'
export VISUAL='nvim'
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

# Exclude file paths from fd search in fzf.
# Customize as you see fit:
export FZF_DEFAULT_COMMAND='fd -H -t f \
-E "cache*" \
-E "Cache*" \
-E ".cache*" \
-E "cookies*" \
-E "Cookies*" \
-E ".git" \
-E ".github" \
-E ".npm" \
-E "Code Cache" \
-E "CacheStorage" \
-E "ScriptCache" \
-E "Session Storage" \
-E "sessionData" \
-E "Service Worker" \
-E "/sys/" \
-E "/mnt/" \
-E "/usr/src/" \
-E ".snapshots/" \
-E "home/.snapshots/" \
-E "home/$USER/.nv/" \
-E "home/$USER/.terminfo/" \
-E "home/$USER/.terminfo/" \
-E "home/$USER/.steam/" \
-E "home/$USER/.mozilla/" \
-E "home/$USER/.cargo/registry/" \
-E "home/$USER/.cargo/git/" \
-E "home/$USER/.local/state/" \
-E "home/$USER/.local/lib/" \
-E "home/$USER/.local/share/Steam/" \
-E "home/$USER/.local/share/nvim/" \
-E "home/$USER/.local/share/gvfs-metadata/" \
-E "home/$USER/.local/share/Smart Code ltd/" \
-E "home/$USER/JW-SERVER/div/games/ludusavi-backup/" \
-E ".nv/" \
-E ".terminfo/" \
-E ".rustup/" \
-E ".steam/" \
-E ".mozilla/" \
-E ".cargo/registry/" \
-E ".cargo/git/" \
-E ".local/state/" \
-E ".local/lib/" \
-E ".local/share/Steam/" \
-E ".local/share/nvim/" \
-E ".local/share/gvfs-metadata/" \
-E ".local/share/Smart Code ltd/" \
-E "JW-SERVER/div/games/ludusavi-backup/"'


# ALIAS:
alias yesgui='sudo systemctl set-default graphical.target && systemctl restart lightdm'
