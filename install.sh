#!/bin/bash
sudo pacman -S --needed --noconfirm base-devel git
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

yay -Syu --noconfirm --needed git stow python python-questionary python-rich fish
python ./dots.py
