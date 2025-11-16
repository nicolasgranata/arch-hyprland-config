#!/bin/bash

echo "Instalando Display Manager sddm"
sudo pacman -S --needed --noconfirm sddm

echo "Iniciando la copia de la configuración de SDDM..."

DOTFILES_SDDM_PAM="$HOME/dotfiles/sddm/sddm_pam"

ETC_SOURCE="$DOTFILES_SDDM_PAM/etc/sddm.conf.d"
ETC_DEST="/etc/sddm.conf.d"

PAM_SOURCE="$DOTFILES_SDDM_PAM/etc/pam.d/sddm"
PAM_DEST="/etc/pam.d/sddm"

if [ -d "$ETC_SOURCE" ]; then
    sudo cp -v "$ETC_SOURCE"/*.conf "$ETC_DEST"
    if [ $? -eq 0 ]; then
        echo "Configuración copiada exitosamente."
    else
        echo "Error al copiar archivos de configuración."
        exit 1
    fi
else
    echo "El directorio de origen $ETC_SOURCE no existe. Saltando configuración."
    exit 1
fi

sudo systemctl restart sddm.service