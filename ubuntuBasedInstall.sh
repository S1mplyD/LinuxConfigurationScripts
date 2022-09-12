#!/bin/bash

#update system

echo UPDATING SYSTEM
sudo apt update && sudo apt upgrade

#install from apt package manager

echo INSTALLING thunderbird telegram-desktop okular vim vlc bashtop zsh discord alacritty
sudo apt install thunderbird telegram-desktop okular vim vlc bashtop zsh discord alacritty

#install google chrome

echo INSTALLING google-chrome-stable
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

#install veracrypt

echo INSTALLING veracrypt
cd ~/Downloads
wget https://launchpadlibrarian.net/601954341/veracrypt-1.25.9-Ubuntu-22.04-amd64.deb
sudo dpkg -i veracrypt-1.25.9-Ubuntu-22.04-amd64.deb

#install vs codium

echo INSTALLING vscodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium

#install code extensions
sudo chmod +x vscodeExtInstall.sh
./vscodeExtInstall.sh

#install spotify

echo INSTALLING spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client