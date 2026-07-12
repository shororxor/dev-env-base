#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -A links
links[".bashrc"]="$HOME/.bashrc"
links[".config/nvim"]="$HOME/.config/nvim"
links[".vimrc"]="$HOME/.vimrc"
links[".vim"]="$HOME/.vim"
links[".tmux.conf"]="$HOME/.tmux.conf"
links[".tmux"]=$HOME/.tmux
links[".config/opencode/tui.json"]="$HOME/.config/opencode/tui.json"

for src in "${!links[@]}"; do
    dest="${links[$src]}"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "$dest already exists, skipping."
    else
        mkdir -p "$(dirname "$dest")"
        ln -s "$SCRIPT_DIR/dotfiles/$src" "$dest"
        echo "$dest setup successfully."
    fi
done
