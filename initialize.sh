#!/bin/bash
### setup git
git config --global user.email "norman@normstorm.com"
git config --global user.name "Norman Tang"
cp ~/configuration/.vimrc ~/
cp ~/configuration/.bashrc ~/
cp ~/configuration/.inputrc ~/
cp ~/configuration/doupdate.sh ~/
chmod u+x ~/doupdate.sh
### setup node 
~/doupdate.sh
chmod u+x ~/configuration/setupnode.sh
cd ~/
~/configuration/setupnode.sh
### setup python 
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update -y
sudo apt install python3.8 -y
sudo apt install gnome-tweaks  # need this for setting up right mouse click on laptop trackpad
sudo snap install htop 
sudo apt install materia-gtk-theme -y
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt-get update -y && sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
