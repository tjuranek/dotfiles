#!/bin/bash

# macOS Bloatware Removal Script
# Removes unwanted default macOS applications
# This script is idempotent and safe to run multiple times

echo "🗑️  Starting macOS bloatware removal..."
echo ""

# Array of unwanted applications (add/remove as needed)
UNWANTED_APPS=(
    # Apple Media Apps
    "Music"
    "TV" 
    "Podcasts"
    "News"
    "Stocks"
    "Home"
    "Shortcuts"
    
    # Apple Productivity Apps  
    "Keynote"
    "Numbers" 
    "Pages"
    "GarageBand"
    "iMovie"
    
    # Games and Entertainment
    "Chess"
    
    # Keeping these apps (commented out):
    # "FaceTime"
    # "Messages" 
    # "Mail"
    # "Calendar"
    # "Contacts"
    # "Reminders"
    # "Notes"
    # "Voice Memos"
    # "Photo Theater"
)

# Function to safely remove an application
remove_app() {
    local app_name="$1"
    local app_path="/Applications/${app_name}.app"
    
    if [[ -d "$app_path" ]]; then
        echo "  🔸 Removing ${app_name}..."
        if sudo rm -rf "$app_path" 2>/dev/null; then
            echo "    ✅ ${app_name} removed successfully"
        else
            echo "    ⚠️  Failed to remove ${app_name} (may require manual removal)"
        fi
    else
        echo "  ✓ ${app_name} already removed or not found"
    fi
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This script is designed for macOS only"
    exit 1
fi

# Show what will be removed
echo "📋 Removing the following apps:"
for app in "${UNWANTED_APPS[@]}"; do
    if [[ -d "/Applications/${app}.app" ]]; then
        echo "  • $app (found)"
    else
        echo "  • $app (not found)"
    fi
done
echo ""

# Remove each unwanted application
echo "🚀 Removing applications..."
for app in "${UNWANTED_APPS[@]}"; do
    remove_app "$app"
done

echo ""
echo "🎉 Bloatware removal complete!"
echo "📝 Note: Some apps may reappear after macOS updates"
echo ""
