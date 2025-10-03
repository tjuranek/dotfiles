# Dotfiles

Personal macOS development environment configuration.

## Fresh Machine Setup

On a brand new Mac, run this command to get started:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/tjuranek/dotfiles/master/bootstrap.sh)
```

This clones the dotfiles repo to `~/repos/dotfiles` using HTTPS (no SSH key required).

**Note**: You'll be prompted for your password during Homebrew installation (sudo access required).

Then run the installer:

```bash
cd ~/repos/dotfiles
./install.sh
```

The installer will:
- Install Homebrew (if not present)
- Install all packages from Brewfile (including 1Password)
- Create symlinks for config files
- Apply macOS system preferences

After installation, set up 1Password and configure SSH for future git operations.

## Manual Installation

If you already have git:

```bash
git clone https://github.com/tjuranek/dotfiles.git ~/repos/dotfiles
cd ~/repos/dotfiles
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
