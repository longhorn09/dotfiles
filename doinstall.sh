#!/bin/bash

# repos
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo add-apt-repository ppa:appimagelauncher-team/stable -y
sudo add-apt-repository ppa:ubuntuhandbook1/gdm-settings

sudo apt-get update -y
sudo snap install vlc
# VSCode
sudo apt install software-properties-common apt-transport-https wget -y
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -


sudo snap install --classic notepadqq 
sudo snap install code
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
sudo apt install gdm-settings libglib2.0-dev-bin

sudo apt install gnome-shell-extensions gnome-shell-extension-manager -y

# need for hp printer drivers
sudo apt-get install libjpeg-dev libtool libtool-bin libcups2-dev libsnmp-dev libusb-1.0-0-dev hplip -y

# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install

# virtualbox
# https://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm
# https://www.youtube.com/watch?v=mBRbC-XyQKg
# https://download.virtualbox.org/virtualbox/7.0.20/ 
sudo apt install virtualbox-ext-pack virtualbox-dkms virtualbox-qt virtualbox-guest-additions-iso -y
#sudo apt install virtualbox
sudo apt install build-essential dkms linux-headers-$(uname -r) -y

# uninstall stuff
sudo apt-get purge --auto-remove aisleriot mahjongg gnome-sudoku gnome-mines thunderbird gnome-2048 transmission-gtk gpodder -y
sudo snap remove firefox

# list view default for both budgie and gnome
gsettings set org.nemo.preferences default-folder-viewer 'list-view'    # nemo for budgie
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view' # nautilus for gnome
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# install AppImageLauncher and gnome-screenshot
# nfs-common needed for synology assistant
sudo apt-get install appimagelauncher gnome-screenshot nfs-common stow -y

# mysql workbench
sudo snap install mysql-workbench-community 
sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service # this allows saving of passwords in mysql workbench

#sudo apt-add-repository universe

sudo apt install golang -y
sudo snap install simple-scan
