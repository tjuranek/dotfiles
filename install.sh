#!/bin/bash

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for this session
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f "/usr/local/bin/brew" ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Install packages from Brewfile
brew bundle install

# Install non-Homebrew software
if [[ -x "./non-brew-software.sh" ]]; then
    ./non-brew-software.sh
else
    echo "❌ non-brew-software.sh not found or not executable"
fi

# Create symlinks for dotfiles
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
# ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig"
#

# Create .config directories and symlinks
mkdir -p "$HOME/.config/aerospace"
ln -sf "$PWD/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

mkdir -p "$HOME/.config/aerospace-swipe"
ln -sf "$PWD/aerospace-swipe/config.json" "$HOME/.config/aerospace-swipe/config.json"

# Apply macOS defaults
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo ""
    ./macos-defaults.sh
fi

echo ""
echo "🎉 Installation complete!"
echo "📝 Please restart your terminal or run: source ~/.zshrc"
echo ""
