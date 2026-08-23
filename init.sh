#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo timedatectl set-timezone America/New_York
sudo pro config set apt_news=false

#########################################################
# 1. Bootstrap tools needed to add repos
#########################################################
sudo apt-get update -y
sudo apt-get install -y software-properties-common curl wget gnupg ca-certificates

#########################################################
# 2. Add all third-party repos / keys (no apt update yet)
#########################################################
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo add-apt-repository ppa:cappelikan/ppa -y   # mainline kernel UI
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
#sudo add-apt-repository ppa:alexlarsson/flatpak -y

# gcloud CLI - https://cloud.google.com/sdk/docs/install#deb
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list > /dev/null
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor --batch --yes -o /usr/share/keyrings/cloud.google.gpg

#########################################################
# 3. Single apt update after all repos are configured
#########################################################
sudo apt-get update -y

#########################################################
# 4. All apt packages in one pass
#########################################################
sudo apt-get install -y \
  vim \
  ppa-purge \
  build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev \
  python3.14 \
  gnome-tweaks \
  materia-gtk-theme \
  net-tools \
  python3-setuptools python3-pip pipx python3-pycurl \
  dconf-editor \
  tmux \
  fastfetch \
  default-jdk \
  zip unzip \
  google-cloud-cli \
  fonts-powerline \
  libfuse2t64 \
  ncdu \
  fd-find \
  zoxide \
  smartmontools
  #sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1
  #sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.13 2  # higher priority 2
  #sudo apt install flatpak -y
  # sudo apt install gnome-software-plugin-flatpak -y

#########################################################
# 5. Final refresh and cleanup
#########################################################
sudo apt-get dist-upgrade -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y

#########################################################
# 6. Git, dotfiles helpers, nvm / npm
#########################################################
git config --global user.email "norman@normstorm.com"
git config --global user.name "Norman Tang"

# setup basic config preferences
#cp ~/configuration/.vimrc ~/
#cp ~/configuration/.bashrc ~/
#cp ~/configuration/.inputrc ~/
#cp ~/configuration/doupdate.sh ~/
chmod u+x ~/dotfiles/doupdate.sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
source ~/.bashrc
nvm install-latest-npm
nvm install lts/krypton
nvm install 26
nvm alias default 26.7.0
nvm install-latest-npm

# npm initialization
npm config set init-author-email "norman@normstorm.com" -g
npm config set init-author-name "Norman Tang" -g
npm config set init-author-url "https://www.linkedin.com/in/normstorm/" -g
npm set editor vim
npm config set fund false  # disable funding message during npm install, equiv: npm install --no-fund
npm install -g forever
# sudo npm set editor code # for vscode

##########################################################
# install cursor-cli
#########################################################
# 1. Download and run the official installer script
curl https://cursor.com/install -fsS | bash

# 2. Add ~/.local/bin to your system PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

#########################################################
# Add the WezTerm APT repository key
#########################################################
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg

# Add the repository to your sources list
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

# Update repository lists and install WezTerm
sudo apt update -y
sudo apt install wezterm -y
echo "alias wezterm='WAYLAND_DISPLAY= wezterm'" >> ~/.bashrc
mkdir ~/.config/wezterm
cp ./wezterm.lua ~/.config/wezterm
#########################################################
# 7. Python tooling (pipx), snaps, vim-plug
#########################################################
pipx ensurepath
pipx install httpie
pipx inject httpie httpie-edgegrid edgegrid-python
touch ~/.hushlogin

sudo snap install htop
sudo snap install ngrok  # ngrok - https tunneling thru localhost
sudo snap install httpie
# sudo flatpak install flathub com.github.marktext.marktext -y # markdown editor

# vim configuration
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# within vim do :PlugInstall

curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

chmod u+x ./desktop.sh

#########################################################
# 8. Copy dotfiles
#########################################################
cp .vimrc ~/
cp .bashrc ~/
cp .inputrc ~/
cp .tmux.conf ~/
cp .psqlrc ~/
source ~/.vimrc
source ~/.bashrc
source ~/.inputrc
