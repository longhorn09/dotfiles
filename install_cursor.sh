#!/bin/bash

# Define the direct download link you found
# This points specifically to the Linux x64 AppImage
CURSOR_URL="https://api2.cursor.sh/updates/download/golden/linux-x64/cursor/2.6"
INSTALL_DIR="$HOME/.local/bin"
ICON_DIR="$HOME/.local/share/icons"
APP_DIR="$HOME/.local/share/applications"

echo "🚀 Starting Cursor 2.6 Installation..."

# 1. Install necessary dependencies for AppImages on Ubuntu 24.04/26.04
echo "📦 Installing dependencies..."
sudo apt update && sudo apt install -y libfuse2t64 wget curl

# 2. Create local directories
mkdir -p "$INSTALL_DIR"
mkdir -p "$ICON_DIR"
mkdir -p "$APP_DIR"

# 3. Download the AppImage
# Using -L because api2.cursor.sh will redirect to a CDN (like AWS or Cloudflare)
echo "📥 Downloading Cursor AppImage..."
curl -L "$CURSOR_URL" -o "$INSTALL_DIR/cursor.appimage"

# 4. Make it executable
chmod +x "$INSTALL_DIR/cursor.appimage"

# 5. Fetch a nice icon
echo "🖼️ Setting up icon..."
curl -L "https://www.cursor.com/brand/icon.svg" -o "$ICON_DIR/cursor-icon.svg"

# 6. Create the Desktop Entry
echo "📝 Creating desktop shortcut..."
cat <<EOF > "$APP_DIR/cursor.desktop"
[Desktop Entry]
Name=Cursor
Exec=$INSTALL_DIR/cursor.appimage --no-sandbox
Terminal=false
Type=Application
Icon=$ICON_DIR/cursor-icon.svg
Categories=Development;TextEditor;
Comment=AI-powered code editor
StartupWMClass=Cursor
EOF

# 7. Refresh the system database so it shows up in your menu immediately
update-desktop-database "$APP_DIR"

echo "✅ Installation complete!"
echo "💡 You can now find Cursor in your 'Show Applications' menu."
