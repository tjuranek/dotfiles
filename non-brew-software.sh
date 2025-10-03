#!/bin/bash

# Install software that doesn't come from Homebrew

echo "📦 Installing non-Homebrew software..."

# Install aerospace-swipe
echo "  • Installing aerospace-swipe..."
# Check if already installed by looking for the binary or service
if [[ -f "$HOME/.local/bin/aerospace-swipe" ]] || pgrep -f "aerospace-swipe" > /dev/null 2>&1; then
    echo "    ✅ aerospace-swipe already installed"
else
    curl -sSL https://raw.githubusercontent.com/acsandmann/aerospace-swipe/main/install.sh | bash
    if [ $? -eq 0 ]; then
        echo "    ✅ aerospace-swipe installed successfully"
    else
        echo "    ❌ Failed to install aerospace-swipe"
    fi
fi

echo ""
echo "✅ Non-Homebrew software installation complete!"