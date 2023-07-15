#!/bin/bash

#enable flatpak
echo ENABLING FLATPAK
sudo pacman -S flatpak

#create aur folder
mkdir Documents/Aur

#configure bluetooth
sudo pacman -S bluez bluez-utils -y
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

#install man
sudo pacman -S man -y

#install zsh
echo INSTALLING ZSH
sudo pacman -S zsh -y

echo INSTALLING oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
cp ../configurationFiles/.zshrc ~
echo INSTALLING ZSH PLUGINS
#zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#fishbone++
git clone https://github.com/EYH0602/Fishbonepp
mv Fishbonepp/fishbone++.zsh-theme ~/.oh-my-zsh/themes/
rm Fishbonepp -rf
source ~/.zshrc
zsh

# install neovim
echo INSTALLING NEOVIM
sudo pacman -S neovim -y
#install packer.nvim plugin
echo INSTALLING PACKER
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#install spotify
echo INSTALLING SPOTIFY
sudo pacman -S spotify-launcher -y

#install postman (flatpak)
echo INSTALLING POSTMAN
flatpak install flathub com.getpostman.Postman

#install discord
echo INSTALLING DISCORD
sudo pacman -S discord -y

#install thunderbird
echo INSTALLING THUNDERBIRD
sudo pacman -S thunderbird -y

#install telegram
echo INSTALLING TELEGRAM
sudo pacman -S telegram-desktop -y

#install veracrypt
# echo INSTALLING VERACRYPT
# cd ~/Downloads
# wget https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-CentOS-8-x86_64.rpm
# sudo dnf install veracrypt-1.25.9-CentOS-8-x86_64.rpm

#install nodejs
echo INSTALLING NVM
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
source ~/.zshrc

#install node 17.5.0
echo INSTALLING NODEJS 17.5.0
nvm install 17.5.0

#install prettier and typescript
npm i -g typescript prettier

#install beautysh
sudo pacman -S python -y
sudo pacman -S python-colorama python-setuptools -y
git clone https://aur.archlinux.org/beautysh.git ~/Documents/Aur
cd ~/Documents/Aur/beautysh && makepkg
sudo pacman -U beautysh*.pkg.tar.zst -y

#install filezilla
echo INSTALLING FILEZILLA
sudo pacman -S filezilla -y

#install github desktop
echo INSTALLING GITHUB DESKTOP
flatpak install flathub io.github.shiftey.Desktop
flatpak run io.github.shiftey.Desktop

echo INSTALLATION AND CONFIGURATION DONE, REBOOTING
sudo reboot now
