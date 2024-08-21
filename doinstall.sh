#!/bin/bash
sudo apt-get update -y
sudo snap install --classic notepadqq 
sudo snap install code
sudo snap install google-cloud-cli --classic
#sudo apt-get install google-chrome-stable -y
sudo snap install discord
#sudo snap install gimp
sudo snap install gnome-calculator
sudo snap install slack
#sudo snap install libreoffice
sudo apt-get -y install dconf-editor
sudo snap install pinta # image editing

gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
# needngs i this to customize login screen background
sudo add-apt-repository ppa:ubuntuhandbook1/gdm-settings
sudo apt update -y
sudo apt install gdm-settings libglib2.0-dev-bin

sudo apt install gnome-shell-extensions gnome-shell-extension-manager -y

# need for synology assistant
sudo apt install nfs-common -y

# need for hp printer drivers
sudo apt-get install libjpeg-dev libtool libtool-bin libcups2-dev libsnmp-dev libusb-1.0-0-dev hplip -y

# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install

# virtualbox
# https://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm
# https://www.youtube.com/watch?v=mBRbC-XyQKg
sudo apt install virtualbox virtualbox-ext-pack virtualbox-dkms virtualbox-qt virtualbox-guest-additions-iso -y
sudo apt install build-essential dkms linux-headers-$(uname -r) -y
