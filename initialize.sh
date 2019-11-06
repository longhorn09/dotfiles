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
cp ~/configuration/setupnode.sh ~/
chmod u+x ~/setupnode.sh
~/doupdate.sh
### setup python 
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.8 -y
