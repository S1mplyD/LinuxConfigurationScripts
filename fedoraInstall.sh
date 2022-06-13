#!/bin/bash

#update system
echo UPDATING SYSTEM
sudo dnf update

#configure rpm fusion
echo CONFIGURING RPM FUSION
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core

#enable flatpak
echo ENABLING FLATPAK
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#install codecs
echo INSTALLING CODECS
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

sudo dnf install thunderbird -y#install vs code
echo INSTALLING VS CODE
cd ~/Downloads
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

#install vs code extensions
echo INSTALLING VS CODE EXTENSION
code --install-extension ahmadawais.shades-of-purple
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension esbenp.prettier-vscode
code --install-extension Gruntfuggly.todo-tree
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension PKief.material-icon-theme
code --install-extension Tomi.xajssnippets
code --install-extension aaron-bond.better-comments

#install spotify (flatpak)
echo INSTALLING SPOTIFY
sudo flatpak install flathub com.spotify.Client

#install postman (flatpak)
echo INSTALLING POSTMAN
flatpak install flathub com.getpostman.Postman

#install discord
echo INSTALLING DISCORD
flatpak install flathub com.discordapp.Discord

#install thunderbird
echo INSTALLING THUNDERBIRD
sudo dnf install thunderbird -y

#install telegram
echo INSTALLING TELEGRAM
sudo dnf install telegram

#install brave browser
echo INSTALLING BRAVE BROWSER
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

#install veracrypt
echo INSTALLING VERACRYPT
cd ~/Downloads
wget https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-CentOS-8-x86_64.rpm
sudo dnf install veracrypt-1.25.9-CentOS-8-x86_64.rpm




