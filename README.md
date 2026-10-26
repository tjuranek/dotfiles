# Dotfiles

Personal macOS development environment.

## Fresh Machine Setup

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/tjuranek/dotfiles/master/bootstrap.sh)
cd ~/repos/dotfiles && ./install.sh
```

`install.sh` finds Homebrew at `/opt/homebrew` or `/usr/local` if it is not on `PATH` yet. If the Command Line Tools installer appears, finish it and run `./install.sh` again.

## What's Included

| Config | What |
|--------|------|
| `kitty/` | Terminal (Catppuccin Mocha, CaskaydiaMono Nerd Font) |
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
- Grant privacy/security permissions to AeroSpace
- Set up 1Password
- Copy `id_ed25519` into `~/repos/dotfiles/ssh/`. That directory is `~/.ssh`, and the private key is not in the repo. `install.sh` points the remote at `git@github.com`, so the next pull needs this key.
