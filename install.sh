#!/bin/bash
set -euo pipefail

# Idempotent install script. Assumes this repository was pulled in via the
# bootstrap script, meaning brew was installed and all configuration files
# were cloned.

# Homebrew's installer writes the PATH line into ~/.zprofile, which this
# process will not have if it was started before that.
if ! command -v brew >/dev/null 2>&1; then
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    echo "Homebrew is not installed. Run bootstrap.sh first."
    exit 1
  fi
fi

# Command Line Tools pop a GUI installer and return before it finishes.
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install || true
  echo "Finish the Command Line Tools install, then re-run ./install.sh"
  exit 1
fi

# Install packages from Brewfile. Tap trust is declared in the Brewfile.
brew bundle install

# Create and link all configurations. An existing real directory would make
# ln drop the symlink inside it and leave the old files in place.
mkdir -p "$HOME/.config"
if [[ -e "$HOME/.ssh" && ! -L "$HOME/.ssh" ]]; then
  echo "~/.ssh already exists and is not a symlink. Move it aside, then re-run ./install.sh"
  exit 1
fi
ln -sfn "$PWD/ssh" "$HOME/.ssh"
ln -sfn "$PWD/aerospace" "$HOME/.config/aerospace"
ln -sfn "$PWD/kitty" "$HOME/.config/kitty"
ln -sfn "$PWD/git" "$HOME/.config/git"
ln -sfn "$PWD/mise" "$HOME/.config/mise"
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
