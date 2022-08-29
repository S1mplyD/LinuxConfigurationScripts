#!/bin/bash

echo SYSTEM CONFIGURATION

#Configure DNF
echo CONFIGURING DNF
printf 'max_parallel_downloads=5\ndefaultyes=True\nkeepcache=True' | sudo tee -a /etc/dnf/dnf.conf

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

#install zsh
echo INSTALLING ZSH
sudo dnf install zsh
echo INSTALLING oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
zsh

echo PACKAGES INSTALLATION

#install vs codium
echo INSTALLING VS CODIUM
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium

#install vs code extensions
echo INSTALLING VS CODIUM EXTENSION
codium --install-extension CoenraadS.bracket-pair-colorizer-2
codium --install-extension esbenp.prettier-vscode
codium --install-extension Gruntfuggly.todo-tree
codium --install-extension llvm-vs-code-extensions.vscode-clangd
codium --install-extension PKief.material-icon-theme
codium --install-extension Tomi.xajssnippets
codium --install-extension aaron-bond.better-comments
codium --install-extension octref.vetur
codium --install-extension msjsdiag.vscode-react-native
codium --install-extension mikestead.dotenv
codium --install-extension ecmel.vscode-html-css
codium --install-extension dsznajder.es7-react-js-snippets
codium --install-extension abusaidm.html-snippets

#install spotify (flatpak)
echo INSTALLING SPOTIFY
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub com.spotify.Client

#install postman (flatpak)
echo INSTALLING POSTMAN
flatpak install flathub com.getpostman.Postman

#install discord
echo INSTALLING DISCORD
sudo dnf install discord

#install thunderbird
echo INSTALLING THUNDERBIRD
sudo dnf install thunderbird -y

#install telegram
echo INSTALLING TELEGRAM
sudo dnf install telegram-desktop

#install google chrome
echo INSTALLING GOOGLE CHROME
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable

#install veracrypt
echo INSTALLING VERACRYPT
cd ~/Downloads
wget https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-CentOS-8-x86_64.rpm
sudo dnf install veracrypt-1.25.9-CentOS-8-x86_64.rpm

#install nodejs
echo INSTALLING NVM
sudo dnf install curl
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
source ~/.zshrc

#install node 17.5.0
echo INSTALLING NODEJS 17.5.0
nvm install 17.5.0

#install okular
sudo dnf install okular

#install filezilla
sudo dnf install filezilla

#install github desktop
cd ~/Downloads
wget https://github.com/shiftkey/desktop/releases/download/release-3.0.5-linux1/GitHubDesktop-linux-3.0.5-linux1.rpm
sudo dnf install GitHubDesktop-linux-3.0.5-linux1.rpm

echo INSTALLATION AND CONFIGURATION DONE, REBOOTING
sudo reboot now