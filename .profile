if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export SHELL='/usr/local/bin/zsh'
export TERMINAL='alacritty'
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"
