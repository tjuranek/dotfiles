#!/usr/bin/env bash
# Symlink Linux configs. Idempotent.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$HOME/.config/tmux" "$HOME/.config/git"

ln -sf  "$DIR/linux/zshrc"     "$HOME/.zshrc"
ln -sf  "$DIR/linux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
ln -sf  "$DIR/linux/gitconfig" "$HOME/.config/git/config"
ln -sfn "$DIR/starship"        "$HOME/.config/starship"
