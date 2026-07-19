#!/bin/bash

sudo apt-get update -y

# repos
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo add-apt-repository ppa:appimagelauncher-team/stable -y
sudo add-apt-repository ppa:ubuntuhandbook1/gdm-settings
sudo add-apt-repository ppa:hepp3n/cosmic-epoch -y

sudo apt-get update -y
sudo apt install language-pack-zh-hant ibus-libpinyin ibus-chewing
sudo snap install vlc
# VSCode
sudo apt install software-properties-common apt-transport-https wget -y
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

sudo snap install 1password
#sudo snap install notepadqq 
sudo add-apt-repository ppa:notepadqq-team/notepadqq -y
#sudo apt install notepadqq -y
#sudo snap install gedit
#sudo snap install code --classic
sudo snap install google-cloud-cli --classic
#sudo apt-get install google-chrome-stable -y
sudo snap install discord
sudo snap install gnome-calculator
sudo snap install slack
#sudo snap install libreoffice
sudo snap install tree
sudo apt-get -y install dconf-editor
sudo snap install pinta # basic image editor like paint
sudo snap install okular # PDF viewer

# needngs i this to customize login screen background
sudo apt update -y
sudo apt install gdm-settings libglib2.0-dev-bin -y
sudo apt install gnome-shell-extensions gnome-shell-extension-manager -y

# need for hp printer drivers
sudo apt-get install libjpeg-dev libtool libtool-bin libcups2-dev libsnmp-dev libusb-1.0-0-dev hplip -y
sudo apt install hplip-gui -y
sudo apt install libsane-hpaio sane-utils -y      # scanner drivers
# run hp-setup

# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install

# virtualbox
# https://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm
# https://www.youtube.com/watch?v=mBRbC-XyQKg
# https://download.virtualbox.org/virtualbox/7.0.20/ 
# sudo apt install virtualbox-ext-pack virtualbox-dkms virtualbox-qt virtualbox-guest-additions-iso -y
# sudo apt install build-essential dkms linux-headers-$(uname -r) -y

# uninstall stuff
sudo apt-get purge --auto-remove aisleriot mahjongg gnome-sudoku gnome-mines thunderbird gnome-2048 transmission-gtk gpodder -y
sudo snap remove firefox

# list view default for both budgie and gnome
gsettings set org.nemo.preferences default-folder-viewer 'list-view'    # nemo for budgie
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view' # nautilus for gnome
gsettings set org.gnome.nautilus.list-view use-tree-view false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.desktop.notifications show-banners false

# install AppImageLauncher and gnome-screenshot
# nfs-common needed for synology assistant
sudo apt-get install appimagelauncher gnome-screenshot nfs-common stow -y

# mysql workbench
sudo snap install mysql-workbench-community 
sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service # this allows saving of passwords in mysql workbench

#sudo apt-add-repository universe
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module -y # needed for some gfx libraries
#sudo apt install golang -y
sudo snap install simple-scan

wget https://github.com/peazip/PeaZip/releases/download/10.5.0/peazip_10.5.0.LINUX.GTK2-1_amd64.deb
sudo dpkg -i ./peazip_10.5.0.LINUX.GTK2-1_amd64.deb
sudo apt-get install -f
sudo apt install xdotool -y
sudo apt install flameshot -y   # https://github.com/flameshot-org/flameshot/issues/3712#issuecomment-2334966021
# make a shortcut with : sh -c "QT_QPA_PLATFORM=wayland flameshot gui"

# 1Password install
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --batch --yes --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --batch --yes --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update -y && sudo apt install 1password -y

# Antigravity install
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | \
  sudo gpg --dearmor --yes -o /etc/apt/keyrings/antigravity-repo-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | \
  sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null

#########################################################
# Installation for IBKR desktop
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
#
# sudo hp-setup -i 192.168.1.xxx
sudo apt install intel-gpu-tools -y
sudo apt install nvtop -y

sudo snap install notepadnext --classic
gsettings set org.gnome.desktop.wm.keybindings maximize-vertical "['<Super><Shift>Up']"

##########################################################
# install cursor
##########################################################
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
###################################################
# pin to dock shortcuts
###################################################
cp /var/lib/snapd/desktop/applications/notepadnext_notepadnext.desktop ~/.local/share/applications/
# need to edit the Exec line
# Exec=env QT_QPA_PLATFORM=xcb /snap/bin/notepadnext %f
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed "s/]/, 'cursor.desktop']/ ") "
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed "s/]/, 'org.gnome.Console.desktop']/ ")"
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed "s/]/, '1password.desktop']/ ")"
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed "s/]/, 'notepadnext_notepadnext.desktop']/ ")"
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed "s/]/, 'install4j_ntws.desktop']/ ")"
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed "s/]/, 'google-chrome.desktop']/ ")"
update-desktop-database "$APP_DIR"

