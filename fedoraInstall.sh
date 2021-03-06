#!/bin/bash

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

#install vs code
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
code --install-extension octref.vetur
code --install-extension msjsdiag.vscode-react-native
code --install-extension mikestead.dotenv
code --install-extension ecmel.vscode-html-css
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension abusaidm.html-snippets

#install spotify (flatpak)
echo INSTALLING SPOTIFY
sudo dnf install lpf-spotify-client
lpf update

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

#install nodejs
echo INSTALLING NODEJS
sudo dnf install nodejs

#install android studio
echo INSTALLING ANDROID STUDIO
sudo dnf install -y zlib.i686 ncurses-libs.i686 bzip2-libs.i686
cd /tmp
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.2.1.15/android-studio-2021.2.1.15-linux.tar.gz
sudo tar -zxvf android-studio-*-linux.tar.gz
sudo mv android-studio /opt/
sudo ln -sf /opt/android-studio/bin/studio.sh /usr/local/bin/android-studio

#install umps3 emulator
echo INSTALLING UMPS3 EMULATOR
mkdir ~/Github
cd ~/Github
sudo dnf install git make gcc-c++ cmake qt5-qtbase-devel qt5-qtsvg elfutils-libelf-devel boost-devel libsigc++20-devel gcc-mips64-linux-gnu
git clone https://github.com/virtualsquare/umps3
cd umps3
mkdir build
cd build
cmake ..
make
sudo make install

#install zsh and oh my zsh
echo INSTALLING ZSH
sudo dnf install zsh
echo INSTALLING oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh

echo INSTALLATION AND CONFIGURATION DONE, REBOOTING
sudo reboot now