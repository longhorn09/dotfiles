#!/bin/bash
INSTALL_DIR="$HOME/.local/bin"
ICON_DIR="$HOME/.local/share/icons"
APP_DIR="$HOME/.local/share/applications"
sudo apt update && sudo apt install -y libfuse2t64 wget curl jq
mkdir -p "$INSTALL_DIR" "$ICON_DIR" "$APP_DIR"
CURSOR_URL=$(curl -fsSL "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | jq -r '.downloadUrl')
curl -L "$CURSOR_URL" -o "$INSTALL_DIR/cursor.appimage"
chmod +x "$INSTALL_DIR/cursor.appimage"
curl -L "https://www.cursor.com/brand/icon.svg" -o "$ICON_DIR/cursor-icon.svg"
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
update-desktop-database "$APP_DIR"
