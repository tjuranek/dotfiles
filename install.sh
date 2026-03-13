#!/bin/bash

# Idempotent install script. Assumes this repository was pulled in via the
# bootstrap script, meaning brew was installed and all configuration files
# were cloned.

# Install MacOS default command line tool
xcode-select --install

# Install packages from Brewfile
brew bundle install

# Create and link all configurations
mkdir -p "$HOME/.config"
ln -sfn "$PWD/ssh" "$HOME/.ssh"
ln -sfn "$PWD/aerospace" "$HOME/.config/aerospace"
ln -sf "$PWD/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
ln -sfn "$PWD/git" "$HOME/.config/git"
ln -sfn "$PWD/mise" "$HOME/.config/mise"
ln -sfn "$PWD/nvim" "$HOME/.config/nvim"
ln -sfn "$PWD/starship" "$HOME/.config/starship"
ln -sfn "$PWD/tmux" "$HOME/.config/tmux"
ln -sf "$PWD/zsh/.zshrc" "$HOME/.zshrc"

# Install runtimes from Mise config
mise trust && mise install

# Switch git remote to SSH since HTTP used in bootstrap
git remote set-url origin git@github.com:tjuranek/dotfiles.git

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
