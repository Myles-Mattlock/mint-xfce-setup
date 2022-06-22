#!/bin/bash

# Copying and moving files to the right locations 
#sudo cp plank.desktop /etc/xdg/autostart
#sudo cp -r themes ~/.local/share/plank/
# Remove obslete packages
sudo apt remove atril* parole* xarchiver* xsane* xterm* xfburn* exfalso* catfish* xreader* gnome-disk-utility* gnome-logs* sticky* gucharmap* seahorse* onboard* xfce4-whiskermenu-plugin xfce4-xkb-plugin drawing pix* hexchat* webapp-manager thunderbird* celluloid* libreoffice* xed* -y
sudo apt purge atril* parole* xarchiver* xsane* xterm* xfburn* exfalso* catfish* xreader* gnome-disk-utility* gnome-logs* sticky* gucharmap* seahorse* onboard* xfce4-whiskermenu-plugin xfce4-xkb-plugin drawing pix* hexchat* webapp-manager thunderbird* celluloid* libreoffice* xed* -y

sudo apt autoremove -y

# Update packages list
sudo apt update

sudo apt upgrade -y

# Add base packages
sudo apt install grub-customizer unzip evince neofetch plank htop vlc libdvd-pkg rhythmbox kodi pulseeffects pavucontrol nemo fonts-noto-color-emoji fonts-firacode fonts-font-awesome gdebi -y

# Setting up the dpkg
sudo dpkg-reconfigure libdvd-pkg

#Addition packages to install
cd Packages/
sudo gdebi code.deb -n
sudo gdebi GitHubDesktop-linux.deb -n
sudo gdebi google-chrome-stable_current.deb -n
sudo gdebi teams.deb -n

#Adding libreoffice-fresh
cd LibreOffice_7.2.4.1_Linux_x86-64_deb/DEBS/
sudo dpkg -i *.deb
# Make Theme folders
mkdir -p ~/.themes ~/.fonts

# `ubuntu nerd font
cd ..
unzip UbuntuMono.zip -d ~/.fonts
fc-cache -vf

# Download Nordic Theme
cd /usr/share/themes/
sudo git clone https://github.com/EliverLara/Nordic.git

# Ms-fonts
sudo apt install ttf-mscorefonts-installer -y

#Finish off with a reboot
echo "System will reboot in 10 seconds"
sleep 10
sudo reboot
