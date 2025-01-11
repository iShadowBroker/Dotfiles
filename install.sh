#!/bin/bash
sudo pacman -S --needed --noconfirm git
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

yay -Syu --noconfirm --needed git stow python python-questionary
python ./dots.py
