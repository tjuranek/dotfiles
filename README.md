# Dotfiles

Personal macOS development environment configuration.

## Installation

```bash
git clone https://github.com/thomasjuranek/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What's Included

### Package Management
- **Brewfile**: Homebrew packages and applications
- Automatic Homebrew installation if not present

### Shell Configuration  
- **Zsh**: Custom `.zshrc` with aliases and settings

### Window Management
- **AeroSpace**: Tiling window manager configuration

### macOS System Reset & Configuration
The `macos-defaults.sh` script:
- **Resets ALL macOS settings** to system defaults (Dock, Finder, Safari, etc.)
- **Applies custom preferences** - currently just dock auto-hide settings
- Ensures clean state for consistent configuration

## Manual Steps

Some settings may require manual configuration:
- Privacy & Security permissions
- Application-specific preferences
- iCloud and Apple ID settings

## Customization

Edit `macos-defaults.sh` to add more custom settings after the reset section. Run `./macos-defaults.sh` independently to completely reset macOS and apply your preferences.

**Warning**: This script resets ALL macOS system preferences to defaults before applying custom settings.