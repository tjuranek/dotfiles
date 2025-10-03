# Agent Guidelines for Dotfiles Repository

## Build/Test Commands
- Install dependencies: `brew bundle install`
- Run installer script: `./install.sh`
- No test suite available
- No single test commands

## Code Style Guidelines
- **Shell scripts**: Use `#!/bin/bash` shebang, 4-space indentation
- **TOML config**: Use lowercase keys with dashes, consistent spacing
- **Comments**: Include descriptive comments for complex configurations
- **File naming**: Use lowercase with dots/dashes (`.zshrc`, `aerospace.toml`)

## Project Structure
- Configuration files in root or dedicated directories (`aerospace/`)
- Brewfile for package management
- Shell aliases use single quotes, simple format
- Symlink creation with `-sf` flags for safety

## Error Handling
- Check command availability with `command -v`
- Use conditional installation checks
- Provide user feedback with echo statements and emojis
- Create directories before symlinking (`mkdir -p`)

This is a personal dotfiles repository focused on macOS development environment setup.