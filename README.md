# Dotfiles

Personal macOS development environment.

## Fresh Machine Setup

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/tjuranek/dotfiles/master/bootstrap.sh)
cd ~/repos/dotfiles && ./install.sh
```

## What's Included

| Config | What |
|--------|------|
| `ghostty/` | Terminal (Catppuccin Mocha, CaskaydiaMono Nerd Font) |
| `nvim/` | Neovim (LazyVim) |
| `tmux/` | tmux (C-a prefix, vim nav) |
| `zsh/` | Shell aliases, zoxide, starship prompt |
| `aerospace/` | Tiling window manager |
| `starship/` | Prompt theme |
| `git/` | Git config |
| `ssh/` | SSH config |
| `mise/` | Runtime versions (node, python) |

### Scripts

- `bootstrap.sh` — curl this onto a bare Mac. Installs Homebrew, clones the repo.
- `install.sh` — brew bundle, symlinks, mise install, macOS defaults, wallpaper.
- `macos-defaults.sh` — dock, menu bar, window dragging. Can be re-run independently.

## Manual Steps

After install:
- Grant privacy/security permissions to AeroSpace, Raycast, etc.
- Set up 1Password
- Configure SSH keys for git
