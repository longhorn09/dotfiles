#!/bin/bash
sudo timedatectl set-timezone America/New_York
sudo apt-get update -y

# install vim
sudo apt install vim -y

# setup git
git config --global user.email "norman@normstorm.com"
git config --global user.name "Norman Tang"

# setup basic config preferences 
cp ~/configuration/.vimrc ~/
cp ~/configuration/.bashrc ~/
cp ~/configuration/.inputrc ~/
cp ~/configuration/doupdate.sh ~/
chmod u+x ~/doupdate.sh

# setup node 
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo apt install npm -y

# npm initialization
sudo npm config set init-author-email "norman@normstorm.com" -g
sudo npm config set init-author-name "Norman Tang" -g
sudo npm config set init-author-url "https://www.linkedin.com/in/normstorm/" -g
sudo npm set editor vim  
# sudo npm set editor code # for vscode

# setup python 
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update -y
sudo apt install python3.8 -y
sudo apt install gnome-tweaks -y # need this for setting up right mouse click on laptop trackpad
sudo snap install htop 
sudo apt install materia-gtk-theme -y

# install flatpak
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt-get update -y && sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak install flathub com.github.marktext.marktext -y # markdown editor

sudo apt install net-tools -y # needed for netstat -tulpn

# WINE OPTIONAL 
# sudo apt install wine64 -y # needed for windows emulation
# sudo apt-get install winetricks -y

# setup some python and akamai stuff
# sudo apt-get install -y python-setuptools
sudo apt-get install -y python3-setuptools
sudo apt install python-pip -y
pip install edgegrid-python  # https://github.com/akamai/AkamaiOPEN-edgegrid-python
sudo apt install httpie -y
pip install httpie-edgegrid  # better to git clone the source repo and  build than do this: https://github.com/akamai/httpie-edgegrid

# setting list-view as default for nemo file manager (Budgie specific)
# org : nemo : preferences : default-folder-viewer
sudo apt-get install dconf-editor -y

# vim configuration
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# within vim do :PlugInstall

sudo apt install tmux -y # terminal multiplexer

# needed for Slack chatbot dev
sudo snap install ngrok  # ngrok - https tunneling thru localhost

sudo apt install neofetch -y    # for basic system stats

# install java
sudo apt install default-jdk -y
sudo apt install zip unzip
curl -s https://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# setup for gcloud CLI - https://cloud.google.com/sdk/docs/install#deb
sudo apt-get update -y && sudo apt-get upgrade -y
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
sudo apt-get update -y && sudo apt-get install google-cloud-cli -y

# final refresh and cleanup
sudo apt dist-upgrade -y
sudo apt-get upgrade -y
sudo apt autoremove -y
