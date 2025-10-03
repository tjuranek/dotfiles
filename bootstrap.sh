#!/bin/bash

set -e

DOTFILES_DIR="$HOME/repos/dotfiles"

echo "🚀 Bootstrapping dotfiles..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew already installed"
fi

# Install git via Homebrew if not installed
if ! command -v git &> /dev/null; then
    echo "📦 Installing git via Homebrew..."
    brew install git
else
    echo "✅ git already installed"
fi

# Create repos directory if it doesn't exist
mkdir -p "$HOME/repos"

# Clone dotfiles using HTTPS (no SSH key needed for public repos)
echo "📥 Cloning dotfiles repository..."
if [[ ! -d "$DOTFILES_DIR" ]]; then
    git clone -b master https://github.com/tjuranek/dotfiles.git "$DOTFILES_DIR"
else
    echo "📁 Dotfiles directory already exists, pulling latest changes..."
    cd "$DOTFILES_DIR" && git checkout master && git pull
fi

echo ""
echo "✅ Dotfiles cloned to ~/repos/dotfiles"
echo "📌 Next: cd ~/repos/dotfiles && ./install.sh"
echo ""
