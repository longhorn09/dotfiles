#!/bin/bash

# install mysql workbench
# https://askubuntu.com/questions/1242026/cannot-connect-mysql-workbench-to-mysql-server
sudo apt-get update -y
snap install mysql-workbench-community -y
sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service

# download chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

# VSCode
sudo apt install software-properties-common apt-transport-https wget -y
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
#sudo apt install code -y
sudo snap install --classic code

# Android studio
sudo add-apt-repository ppa:maarten-fonville/android-studio -y
sudo apt-get update -y && sudo apt-get upgrade -y
#sudo apt install android-studio -y
sudo snap install android-studio --classic

# gnome screenshot
sudo apt-get update -y
sudo apt-get install gnome-screenshot -y

# shutter screenshot tool
sudo add-apt-repository universe
sudo apt-get update -y
sudo apt install shutter -y

# google cloud cli
sudo snap install google-cloud-cli --classic

