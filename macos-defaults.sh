#!/bin/bash

# macOS System Preferences
# Reset configured domains to defaults, then apply custom preferences

echo "🔄 Resetting configured domains to defaults..."

defaults delete com.apple.dock 2>/dev/null || true
defaults delete com.apple.menuextra.clock 2>/dev/null || true
defaults delete com.apple.menuextra.battery 2>/dev/null || true
defaults delete NSGlobalDomain NSWindowShouldDragOnGesture 2>/dev/null || true
defaults delete NSGlobalDomain NSAutomaticWindowAnimationsEnabled 2>/dev/null || true

echo "🛠️ Applying custom preferences..."

# Dock: left, tiny, auto-hide, no delay
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock tilesize -int 16
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Safari.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Ghostty.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

# Menu bar
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm:ss a"
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Window management
defaults write -g NSWindowShouldDragOnGesture -bool true
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain _HIHideMenuBar -bool false

# Restart affected services
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

echo "✅ Done!"
