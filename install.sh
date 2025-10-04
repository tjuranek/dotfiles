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

# Create symlinks for dotfiles
 mkdir -p "$HOME/.config"

 ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
 ln -sf "$PWD/starship/starship.toml" "$HOME/.config/starship.toml"
 ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig"
 ln -sf "$PWD/ghostty" "$HOME/.config/ghostty"
 ln -sf "$PWD/btop" "$HOME/.config/btop"
 ln -sf "$PWD/btop/themes" "$HOME/.config/btop/themes"

 mkdir -p "$HOME/.config/btop"
 ln -sf "$PWD/btop" "$HOME/.config/btop"

 # Set up SSH config
 mkdir -p "$HOME/.ssh"
 ln -sf "$PWD/.ssh/config" "$HOME/.ssh/config"
 chmod 600 "$HOME/.ssh/config"
  chmod 700 "$HOME/.ssh"
  #

# Switch git remote to SSH
git remote set-url origin git@github.com:tjuranek/dotfiles.git

# Create .config directories and symlinks
mkdir -p "$HOME/.config/aerospace"
ln -sf "$PWD/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

mkdir -p "$HOME/.config/sketchybar"
ln -sf "$PWD/sketchybar/sketchybarrc" "$HOME/.config/sketchybar/sketchybarrc"

# Apply macOS defaults
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo ""
    ./macos-defaults.sh
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$PWD/wallpaper.jpg\""
fi

echo ""
echo "🎉 Installation complete!"
echo "📝 Please restart your terminal or run: source ~/.zshrc"
echo ""
