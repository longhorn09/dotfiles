#!/bin/bash
sudo apt-get update -y
sudo snap install --classic notepadqq 
sudo snap install code
sudo snap install google-cloud-cli --classic
#sudo apt-get install google-chrome-stable -y
sudo snap install discord
sudo snap install gimp
sudo snap install gnome-calculator
sudo snap install slack
sudo apt-get -y install dconf-editor

gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
# needngs i this to customize login screen background
sudo add-apt-repository ppa:ubuntuhandbook1/gdm-settings
sudo apt update -y
sudo apt install gdm-settings libglid2.0-dev-bin
# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install

# virtualbox
# https://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm
sudo apt install virtualbox virtualbox-ext-pack virtualbox-dkms virtualbox-qt virtualbox-guest-additions-iso -y

