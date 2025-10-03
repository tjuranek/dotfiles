#!/bin/bash

# macOS System Reset and Configuration
# Reset ALL macOS settings to defaults, then apply custom preferences

echo "🔄 Resetting macOS to system defaults..."

# Reset all major system preference domains
echo "  • Resetting Dock..."
defaults delete com.apple.dock 2>/dev/null || true

echo "  • Resetting Finder..."
defaults delete com.apple.finder 2>/dev/null || true

echo "  • Resetting Safari..."
defaults delete com.apple.Safari 2>/dev/null || true

echo "  • Resetting Screenshots..."
defaults delete com.apple.screencapture 2>/dev/null || true

echo "  • Resetting Trackpad..."
defaults delete com.apple.driver.AppleBluetoothMultitouch.trackpad 2>/dev/null || true

echo "  • Resetting Global preferences..."
defaults delete NSGlobalDomain KeyRepeat 2>/dev/null || true
defaults delete NSGlobalDomain InitialKeyRepeat 2>/dev/null || true
defaults delete NSGlobalDomain ApplePressAndHoldEnabled 2>/dev/null || true
defaults delete NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled 2>/dev/null || true
defaults delete NSGlobalDomain NSAutomaticDashSubstitutionEnabled 2>/dev/null || true
defaults delete NSGlobalDomain com.apple.mouse.tapBehavior 2>/dev/null || true
defaults delete NSGlobalDomain _HIHideMenuBar 2>/dev/null || true
defaults delete NSGlobalDomain NSWindowShouldDragOnGesture 2>/dev/null || true
defaults delete NSGlobalDomain NSAutomaticWindowAnimationsEnabled 2>/dev/null || true

echo "  • Resetting Menu Bar Clock..."
defaults delete com.apple.menuextra.clock 2>/dev/null || true

echo "  • Resetting Activity Monitor..."
defaults delete com.apple.ActivityMonitor 2>/dev/null || true

echo ""
echo "✅ System reset complete!"
echo ""
echo "🛠️ Applying custom preferences..."

# Apply ONLY the dock settings you want
echo "  • Configuring Dock..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

echo "  • Configuring Window Dragging..."
defaults write -g NSWindowShouldDragOnGesture -bool true

echo "  • Disabling Window Animations..."
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

echo "  • Restarting system services..."
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

echo ""
echo "✅ Configuration complete!"
echo "   Your system has been reset to defaults with custom dock settings applied."