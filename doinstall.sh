#!/bin/bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

# Ensure clean temp space and automatic cleanup
TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT

echo "==> 1. Bootstrapping toolsets..."
sudo apt-get update -y
sudo apt-get install -y \
  software-properties-common apt-transport-https wget curl gnupg ca-certificates jq git make

echo "==> 2. Adding third-party repositories and keyrings..."
# VSCode repo
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo add-apt-repository ppa:ubuntuhandbook1/gdm-settings -y
sudo add-apt-repository ppa:hepp3n/cosmic-epoch -y
sudo add-apt-repository multiverse -y

# pgAdmin
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor --batch --yes -o /usr/share/keyrings/packages-pgadmin-org.gpg
echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" | sudo tee /etc/apt/sources.list.d/pgadmin4.list > /dev/null

# 1Password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --batch --yes --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list > /dev/null
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol > /dev/null
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --batch --yes --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

# Antigravity
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | sudo gpg --dearmor --yes -o /etc/apt/keyrings/antigravity-repo-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null

echo "==> 3. Updating package indexes and installing primary APT packages..."
sudo apt-get update -y
sudo apt-get install -y \
  language-pack-zh-hant ibus-libpinyin ibus-chewing \
  dconf-editor \
  postgresql-client pgadmin4-desktop pgloader \
  gdm-settings libglib2.0-dev-bin libglib2.0-bin \
  gnome-shell-extensions gnome-shell-extension-manager gnome-shell-extension-prefs \
  libjpeg-dev libtool libtool-bin libcups2-dev libsnmp-dev libusb-1.0-0-dev hplip hplip-gui \
  libsane-hpaio sane-utils \
  gnome-system-monitor \
  appimagelauncher gnome-screenshot nfs-common stow \
  libcanberra-gtk-module libcanberra-gtk3-module \
  xdotool \
  1password \
  intel-gpu-tools nvtop \
  libfuse2t64

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install steam mesa-vulkan-drivers mesa-vulkan-drivers:i386 -y


echo "==> 4. Purging bloat packages..."
sudo apt-get purge --auto-remove -y aisleriot mahjongg gnome-sudoku gnome-mines thunderbird gnome-2048 transmission-gtk gpodder

echo "==> 5. Direct .deb package installations..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O "$TEMP_DIR/chrome.deb"
sudo apt-get install -y "$TEMP_DIR/chrome.deb"

wget -q https://github.com/peazip/PeaZip/releases/download/10.5.0/peazip_10.5.0.LINUX.GTK2-1_amd64.deb -O "$TEMP_DIR/peazip.deb"
sudo apt-get install -y "$TEMP_DIR/peazip.deb"

cd ~

echo "==> 7. Managing Snaps..."
sudo snap remove --purge firefox || true
sudo snap install vlc discord gnome-calculator slack tree simple-scan
sudo snap install google-cloud-cli --classic
sudo snap install notepadnext --classic
sudo snap install paint-electron

echo "==> 8. Installing IBKR Desktop..."
DOWNLOAD_DIR="$HOME/Downloads"
INSTALLER_PATH="$DOWNLOAD_DIR/ntws-latest-standalone-linux-x64.sh"
mkdir -p "$DOWNLOAD_DIR"
curl -fL -# -o "$INSTALLER_PATH" "https://download.interactivebrokers.com/installers/ntws/latest-standalone/ntws-latest-standalone-linux-x64.sh"
chmod +x "$INSTALLER_PATH"
"$INSTALLER_PATH" -q
rm -f "$INSTALLER_PATH"

echo "==> 9. Setting up Cursor AppImage..."
INSTALL_DIR="$HOME/.local/bin"
ICON_DIR="$HOME/.local/share/icons"
APP_DIR="$HOME/.local/share/applications"
mkdir -p "$INSTALL_DIR" "$ICON_DIR" "$APP_DIR"

CURSOR_URL=$(curl -fsSL "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | jq -r '.downloadUrl')
curl -L "$CURSOR_URL" -o "$INSTALL_DIR/cursor.appimage"
chmod +x "$INSTALL_DIR/cursor.appimage"
curl -L "https://www.cursor.com/brand/icon.svg" -o "$ICON_DIR/cursor-icon.svg"

cat <<EOF > "$APP_DIR/cursor.desktop"
[Desktop Entry]
Name=Cursor
Exec=$HOME/.local/bin/cursor.appimage --no-sandbox --open-url %u
Terminal=false
Type=Application
Icon=$ICON_DIR/cursor-icon.svg
Categories=Development;TextEditor;
Comment=AI-powered code editor
StartupWMClass=Cursor
MimeType=x-scheme-handler/cursor;
EOF

echo "==> 10. Desktop configuration and dock pinning..."
cp /var/lib/snapd/desktop/applications/notepadnext_notepadnext.desktop "$APP_DIR/" 2>/dev/null || true

gsettings set org.nemo.preferences default-folder-viewer 'list-view' || true
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.list-view use-tree-view false
gsettings set org.gnome.desktop.notifications show-banners false
gsettings set org.gnome.desktop.wm.keybindings maximize-vertical "['<Super><Shift>Up']"

python3 -c "
import subprocess, ast, os

desired_apps = [
    'cursor.desktop',
    'org.gnome.Console.desktop',
    '1password.desktop',
    'notepadnext_notepadnext.desktop',
    'install4j_ntws.desktop',
    'google-chrome.desktop',
    'pgadmin4.desktop'
]

app_id = 'org.gnome.SystemMonitor.desktop' if os.path.exists('/usr/share/applications/org.gnome.SystemMonitor.desktop') else 'gnome-system-monitor.desktop'
if app_id not in desired_apps:
    desired_apps.append(app_id)

raw_apps = subprocess.check_output(['gsettings', 'get', 'org.gnome.shell', 'favorite-apps']).decode().strip()
curr_apps = ast.literal_eval(raw_apps)

updated = False
for app in desired_apps:
    if app not in curr_apps:
        curr_apps.append(app)
        updated = True

if updated:
    subprocess.run(['gsettings', 'set', 'org.gnome.shell', 'favorite-apps', str(curr_apps)])
"

update-desktop-database "$APP_DIR"
echo "==> Script finished successfully!"
