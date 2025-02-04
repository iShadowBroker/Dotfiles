#!/bin/bash

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo cp ./pacman/pacman.conf /etc/pacman.conf

echo "Do you want to install the packages for this dotfiles? (y/n)"
read install_packages

if [ $install_packages = "y" ]; then
  yay -Sy --needed --noconfirm - < ./pacman/packages.txt
  title
  echo "Packages installed."
else
  title
  echo "Packages not installed."
fi

sudo usermod -aG input $USER
sudo usermod -aG seat $USER

# Change shell to fish
chsh -s /bin/fish
