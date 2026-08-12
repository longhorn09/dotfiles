#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

#########################################################
# 1. Bootstrap tools needed to add repos
#########################################################
sudo apt-get update -y
sudo apt-get install -y software-properties-common apt-transport-https wget curl gnupg ca-certificates jq

#########################################################
# 2. Add all third-party repos / keys (no apt update yet)
#########################################################
# VSCode (repo only; install commented historically)
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
#sudo add-apt-repository ppa:appimagelauncher-team/stable -y
sudo add-apt-repository ppa:ubuntuhandbook1/gdm-settings -y
sudo add-apt-repository ppa:hepp3n/cosmic-epoch -y
sudo add-apt-repository multiverse -y
#sudo apt-add-repository universe -y

# pgAdmin
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor --batch --yes -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'

# 1Password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --batch --yes --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --batch --yes --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

# Antigravity
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | \
  sudo gpg --dearmor --yes -o /etc/apt/keyrings/antigravity-repo-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | \
  sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null

#########################################################
# 3. Single apt update after all repos are configured
#########################################################
sudo apt-get update -y

#########################################################
# 4. All apt packages in one pass
#########################################################
sudo apt-get install -y \
  language-pack-zh-hant ibus-libpinyin ibus-chewing \
  dconf-editor \
  postgresql-client pgadmin4-desktop pgloader \
  gdm-settings libglib2.0-dev-bin \
  gnome-shell-extensions gnome-shell-extension-manager \
  libjpeg-dev libtool libtool-bin libcups2-dev libsnmp-dev libusb-1.0-0-dev hplip \
  hplip-gui \
  libsane-hpaio sane-utils \
  gnome-system-monitor \
  appimagelauncher gnome-screenshot nfs-common stow \
  libcanberra-gtk-module libcanberra-gtk3-module \
  xdotool \
  1password \
  intel-gpu-tools \
  nvtop \
  libfuse2t64
  #sudo apt install golang -y
  #sudo apt install flameshot -y   # https://github.com/flameshot-org/flameshot/issues/3712#issuecomment-2334966021
  # make a shortcut with : sh -c "QT_QPA_PLATFORM=wayland flameshot gui"
  #sudo apt install virtualbox virtualbox-ext-pack virtualbox-dkms virtualbox-qt virtualbox-guest-additions-iso -y
  #sudo usermod -aG vboxusers $USER
  # path: /usr/share/virtualbox/VBoxGuestAdditions.iso
  # You can manually attach it by going to VM Settings > Storage > click the CD Icon > Choose/Create a Disk Image... and browsing to that path.

# uninstall stuff
sudo apt-get purge --auto-remove aisleriot mahjongg gnome-sudoku gnome-mines thunderbird gnome-2048 transmission-gtk gpodder -y

#########################################################
# 5. Direct .deb installs (uses already-updated indexes)
#########################################################
# google chrome
#sudo apt-get install google-chrome-stable -y
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install -y ./google-chrome-stable_current_amd64.deb

# peazip
wget -q https://github.com/peazip/PeaZip/releases/download/10.5.0/peazip_10.5.0.LINUX.GTK2-1_amd64.deb
sudo apt-get install -y ./peazip_10.5.0.LINUX.GTK2-1_amd64.deb

#########################################################
# 6. Snaps
#########################################################
sudo snap install vlc
sudo snap install google-cloud-cli --classic
sudo snap install discord
sudo snap install gnome-calculator
sudo snap install slack
#sudo snap install libreoffice
sudo snap install tree
#sudo snap install pinta # basic image editor like paint
sudo snap install okular # PDF viewer
#sudo snap install dbeaver-ce --classic
#sudo snap install pgadmin4
#sudo snap connect pgadmin4:home
#sudo snap connect pgadmin4:password-manager-service
# mysql workbench - commented out because i use postgres on neondb more now
#sudo snap install mysql-workbench-community
#sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service # this allows saving of passwords in mysql workbench
sudo snap install simple-scan
sudo snap install notepadnext --classic
sudo snap remove --purge firefox

#########################################################
# 7. IBKR desktop
#########################################################
BASE_URL="https://download.interactivebrokers.com/installers/ntws/latest-standalone"
INSTALLER_NAME="ntws-latest-standalone-linux-x64.sh"
DOWNLOAD_DIR="$HOME/Downloads"
INSTALLER_PATH="$DOWNLOAD_DIR/$INSTALLER_NAME"
mkdir -p "$DOWNLOAD_DIR"
curl -fL -# -o "$INSTALLER_PATH" "$BASE_URL/$INSTALLER_NAME"
chmod +x "$INSTALLER_PATH"
"$INSTALLER_PATH" -q
rm "$INSTALLER_PATH"
# sudo hp-setup -i 192.168.1.xxx

#########################################################
# 8. Cursor
#########################################################
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

#########################################################
# 9. Desktop entries, gsettings, dock pins
#########################################################
mkdir -p ~/.local/share/applications
cp /var/lib/snapd/desktop/applications/notepadnext_notepadnext.desktop ~/.local/share/applications/ 2>/dev/null || true
#cp /var/lib/snapd/desktop/applications/mysql-workbench-community_mysql-workbench-community.desktop ~/.local/share/applications/ 2>/dev/null || true
#cp /var/lib/snapd/desktop/applications/beekeeper-studio_beekeeper-studio.desktop ~/.local/share/applications/ 2>/dev/null || true

# list view default for both budgie and gnome
gsettings set org.nemo.preferences default-folder-viewer 'list-view'    # nemo for budgie
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view' # nautilus for gnome
gsettings set org.gnome.nautilus.list-view use-tree-view false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
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

update-desktop-database "$HOME/.local/share/applications"
