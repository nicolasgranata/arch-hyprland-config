#!/bin/bash

echo "Instalando Git"
sudo pacman -S --needed --noconfirm git

read -p "Ingrese nombre de usuario para la configuracion de GIT " username
git config --global user.name $username

read -p "Ingrese correo electronico para la configuracion de GIT " email
git config --global user.email $email