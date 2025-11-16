#!/bin/bash

echo "Instalando Gnome Keyring"
sudo pacman -S --needed --noconfirm gnome-keyring

echo "Instalando Seahorse"
sudo pacman -S --needed --noconfirm seahorse