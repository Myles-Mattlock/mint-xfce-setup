#!/bin/bash

# Copying and moving files to the right locations 
sudo cp plank.desktop /etc/xdg/autostart
sudo cp -r themes ~/.local/share/plank/
# Remove obslete packages
sudo apt remove atril* parole* xarchiver* xsane* xterm* xfburn* exfalso* -yq

sudo apt purge atril* parole* xarchiver* xsane* xterm* xfburn* exfalso* -yq

sudo apt autoremove -yq

# Update packages list
sudo apt update

sudo apt upgrade -yq

# Add base packages
sudo apt install file-roller grub-customizer unzip evince neofetch plank htop vlc libdvd-pkg rhythmbox kodi pulseeffects pavucontrol nemo papirus-icon-theme fonts-noto-color-emoji fonts-firacode fonts-font-awesome micro gufw gdebi htop xfce4-clipman -yq

# Setting up the dpkg
sudo dpkg-reconfigure libdvd-pkg

#Addition packages to install
cd Packages/
sudo gdebi code.deb -n
sudo gdebi GitHubDesktop-linux.deb -n
sudo gdebi google-chrome-stable_current.deb -n
sudo gdebi teams.deb -n

# Make Theme folders
mkdir -p ~/.themes ~/.fonts

# `ubuntu nerd font
cd ..
unzip UbuntuMono.zip -d ~/.fonts
fc-cache -vf

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Ms-fonts
sudo apt install ttf-mscorefonts-installer -yq

# Layan Cursors
#cd "$HOME/"
#git clone https://github.com/vinceliuice/Layan-cursors
#cd Layan-cursors
#sudo ./install.sh

#Finish off with a reboot
echo "System will reboot in 10 seconds"
sleep 10
sudo reboot
