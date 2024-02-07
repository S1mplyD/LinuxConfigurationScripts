#!/bin/zsh

#update system

echo UPDATING SYSTEM
sudo apt update && sudo apt upgrade -y

#install from apt package manager

echo installing apt software 
sudo apt install thunderbird telegram-desktop okular neovim vlc btop discord gcc git nnn tmux -y 

#install spotify

echo installing spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

#install brave browser

echo installing brave-browser
sudo apt install curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install brave-browser -y

#install ohmyzsh
echo installing ohmyzsh and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#install nvm
echo installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

#install github desktop
echo installing github desktop
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install github-desktop -y

#install mongodb compass
echo install mongodb compass
wget -P /home/luca/Downloads/ https://downloads.mongodb.com/compass/mongodb-compass_1.42.0_amd64.deb
sudo dpkg -i ~/Downloads/mongodb*.deb

#install postman
echo installing postman
wget -P ~/Downloads/ https://dl.pstmn.io/download/latest/linux_64
sudo tar -xzf ~/Downloads/postman-linux-x64.tar.gz -C /opt
sudo touch /usr/share/applications/Postman.desktop
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=Postman\nExec=/opt/Postman/app/Postman %U\nIcon=/opt/Postman/app/resources/app/assets/icon.png\nTerminal=false\nType=Application\nCategories=Development;" > /usr/share/applications/Postman.desktop
