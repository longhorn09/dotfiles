#!/bin/bash

# install mysql workbench
# https://askubuntu.com/questions/1242026/cannot-connect-mysql-workbench-to-mysql-server
sudo apt-get update -y
sudo snap install mysql-workbench-community 
# this allows saving of passwords in mysql workbench
sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service

# download chrome - comment out - do via snap install instead
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo apt install ./google-chrome-stable_current_amd64.deb -y

# VSCode
sudo apt install software-properties-common apt-transport-https wget -y
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
#sudo snap install --classic code

# Android studio
#sudo add-apt-repository ppa:maarten-fonville/android-studio -y
#sudo apt-get update -y && sudo apt-get upgrade -y
#sudo snap install android-studio --classic

# gnome screenshot
sudo apt-get update -y
sudo apt-get install gnome-screenshot -y

# shutter screenshot tool
sudo add-apt-repository universe -y
sudo apt-get update -y
sudo apt install shutter -y

# google cloud cli
sudo snap install google-cloud-cli --classic

# krita image editing 
# sudo apt install krita -y
#sudo snap install krita

# uninstall stuff
sudo apt-get purge --auto-remove aisleriot mahjongg gnome-sudoku gnome-mines thunderbird gnome-2048 transmission-gtk gpodder -y
sudo snap remove firefox
#git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# notepad++
#sudo snap install notepad-plus-plus
#sudo add-apt-repository ppa:notepadqq-team/notepadqq -y
#sudo apt-get update -y
#sudo snap install --classic notepadqq

# intellij
#sudo add-apt-repository ppa:mmk2410/intellij-idea -y
#sudo apt-get update -y
#sudo apt install intellij-idea-community -y

# calculator
sudo apt-get -y install gnome-calculator

# default list view - nemo file manager for budgie
gsettings set org.nemo.preferences default-folder-viewer 'list-view'

# install AppImageLauncher
sudo add-apt-repository ppa:appimagelauncher-team/stable -y
sudo apt-get update -y
sudo apt-get install -y appimagelauncher

# discord
#sudo snap install discord

# slack
#sudo snap install slack

# install nerd-fonts
#git clone git@github.com:ryanoasis/nerd-fonts.git
#chmod u+x nerd-fonts/install.sh

