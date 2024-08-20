#!/bin/bash
sudo apt-get update -y
sudo snap install notepadqq 
sudo snap install code
sudo snap install google-cloud-cli --classic
#sudo apt-get install google-chrome-stable -y
sudo snap install discord
sudo snap install gimp
sudo snap install gnome-calculator

# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install

# virtualbox
sudo apt install virtualbox virtualbox-ext-pack virtualbox-qt
