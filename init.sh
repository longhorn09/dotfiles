#!/bin/bash
sudo timedatectl set-timezone America/New_York
sudo apt-get update -y

sudo pro config set apt_news=false
# install vim
sudo apt install vim -y

# setup git
git config --global user.email "norman@normstorm.com"
git config --global user.name "Norman Tang"

# setup basic config preferences 
#cp ~/configuration/.vimrc ~/
#cp ~/configuration/.bashrc ~/
#cp ~/configuration/.inputrc ~/
#cp ~/configuration/doupdate.sh ~/
chmod u+x ~/dotfiles/doupdate.sh

# setup node 
#curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
#sudo apt-get install nodejs -y
#sudo apt install npm -y
#npm install -g npm@latest

sudo apt install curl -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
source ~/.bashrc
nvm install-latest-npm
nvm install lts/jod
nvm install 24
nvm use 24
nvm alias default 24

# npm initialization
sudo npm config set init-author-email "norman@normstorm.com" -g
sudo npm config set init-author-name "Norman Tang" -g
sudo npm config set init-author-url "https://www.linkedin.com/in/normstorm/" -g
sudo npm set editor vim  
npm config set fund false  # disable funding message during npm install, equiv: npm install --no-fund
# sudo npm set editor code # for vscode

# setup python 
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update -y
sudo apt install python3.13 -y
#sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1
#sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.13 2  # higher priority 2
sudo apt install gnome-tweaks -y # need this for setting up right mouse click on laptop trackpad
sudo snap install htop 
sudo apt install materia-gtk-theme -y

# install flatpak
#sudo add-apt-repository ppa:alexlarsson/flatpak -y
#sudo apt-get update -y && sudo apt install flatpak -y
# sudo apt install gnome-software-plugin-flatpak -y
# sudo flatpak install flathub com.github.marktext.marktext -y # markdown editor

sudo apt install net-tools -y # needed for netstat -tulpn

# setup some python and akamai stuff
sudo apt-get install -y python3-setuptools
sudo apt install python-pip -y
pip install edgegrid-python  # https://github.com/akamai/AkamaiOPEN-edgegrid-python
pip install httpie-edgegrid  # https://github.com/akamai/httpie-edgegrid
sudo apt install python3-pycurl -y
touch ~/.hushlogin

# setting list-view as default for nemo file manager (Budgie specific)
# org : nemo : preferences : default-folder-viewer
sudo apt-get install dconf-editor -y

# vim configuration
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# within vim do :PlugInstall

sudo apt install tmux -y # terminal multiplexer

# needed for Slack chatbot dev
sudo snap install ngrok  # ngrok - https tunneling thru localhost

# neofetch
sudo apt install neofetch -y    # for basic system stats

# install java
#sudo apt install default-jdk -y
# https://www.linuxcapable.com/how-to-install-openjdk-18-on-ubuntu-22-04-lts/
sudo apt install default-jdk -y
sudo apt install zip unzip -y

# sdkman setup
#curl -s https://get.sdkman.io | bash
#source "$HOME/.sdkman/bin/sdkman-init.sh"
#sdk install kotlin

#install gradle
#sudo add-apt-repository ppa:cwchien/gradle -y
#sudo apt-get update -y
#sudo apt-get install gradle -y
#sdk install gradle 7.6

# setup for gcloud CLI - https://cloud.google.com/sdk/docs/install#deb
sudo apt-get update -y && sudo apt-get upgrade -y
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
sudo apt-get update -y && sudo apt-get install google-cloud-cli -y

# final refresh and cleanup
sudo apt dist-upgrade -y
sudo apt-get upgrade -y
sudo apt autoremove -y

chmod u+x ./desktop.sh
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# mysql client
sudo apt install mysql-client-core-8.0 -y

# httpie
sudo snap install httpie

# copy dotfiles
cp .vimrc ~/
cp .bashrc ~/
cp .inputrc ~/
cp .tmux.conf ~/
source ~/.vimrc
source ~/.bashrc
source ~/.inputrc

sudo apt-get install fonts-powerline
