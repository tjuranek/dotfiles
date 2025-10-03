#!/bin/bash

set -e

DOTFILES_DIR="$HOME/repos/dotfiles"

echo "🚀 Bootstrapping dotfiles..."

# Create repos directory if it doesn't exist
mkdir -p "$HOME/repos"

# Clone dotfiles using HTTPS (no SSH key needed for public repos)
echo "📥 Cloning dotfiles repository..."
if [[ ! -d "$DOTFILES_DIR" ]]; then
    git clone https://github.com/tjuranek/dotfiles.git "$DOTFILES_DIR"
else
    echo "📁 Dotfiles directory already exists, pulling latest changes..."
    cd "$DOTFILES_DIR" && git pull
fi

echo ""
echo "✅ Dotfiles cloned to ~/repos/dotfiles"
echo "📌 Next: cd ~/repos/dotfiles && ./install.sh"
echo ""
