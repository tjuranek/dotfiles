#!/usr/bin/env bash
# Linux/Ubuntu bootstrap for exe.dev VMs. Idempotent.
# Run via exe.dev setup-script:
#   curl -fsSL https://raw.githubusercontent.com/tjuranek/dotfiles/master/linux/bootstrap.sh | bash

set -euo pipefail

REPO="${DOTFILES_REPO:-https://github.com/tjuranek/dotfiles.git}"
DEST="${DOTFILES_DIR:-$HOME/repos/dotfiles}"

# 1. System packages
sudo DEBIAN_FRONTEND=noninteractive apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  zsh tmux git curl ca-certificates build-essential unzip

# 2. mise
if ! command -v mise >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/mise" ]; then
  curl -fsSL https://mise.run | sh
fi
export PATH="$HOME/.local/bin:$PATH"

# 3. CLI tools (no language runtimes — install per-VM as needed)
mise use -g \
  starship@latest \
  zoxide@latest \
  eza@latest \
  fzf@latest \
  bat@latest \
  fd@latest \
  ripgrep@latest \
  direnv@latest \
  lazygit@latest \
  gh@latest

# 4. zsh-vi-mode (no apt package; clone)
if [ ! -d "$HOME/.zsh/zsh-vi-mode" ]; then
  mkdir -p "$HOME/.zsh"
  git clone --depth 1 https://github.com/jeffreytse/zsh-vi-mode.git \
    "$HOME/.zsh/zsh-vi-mode"
fi

# 5. dotfiles repo
if [ ! -d "$DEST" ]; then
  mkdir -p "$(dirname "$DEST")"
  git clone "$REPO" "$DEST"
fi

# 6. symlinks
"$DEST/linux/install.sh"

# 7. zsh as default shell
ZSH_BIN="$(command -v zsh)"
if [ -n "$ZSH_BIN" ] && [ "${SHELL:-}" != "$ZSH_BIN" ]; then
  sudo chsh -s "$ZSH_BIN" "$USER" 2>/dev/null || chsh -s "$ZSH_BIN" || true
fi

echo "Bootstrap complete. Next SSH session lands in zsh + tmux 'main'."
