#!/bin/bash

chmod +x bin/install-hyprland.sh
bash bin/install-hyprland.sh

chmod +x bin/install-gnomekeyring.sh
bash bin/install-gnomekeyring.sh

chmod +x bin/install-sddm.sh
bash bin/install-sddm.sh

chmod +x bin/install-fonts.sh
bash bin/install-fonts.sh

chmod +x bin/install-ohmybash.sh
bash bin/install-ohmybash.sh

chmod +x bin/install-kitty.sh
bash bin/install-kitty.sh

chmod +x bin/install-wofi.sh
bash bin/install-wofi.sh

chmod +x bin/install-yazi.sh
bash bin/install-yazi.sh

chmod +x bin/install-fastfetch.sh
bash bin/install-fastfetch.sh

chmod +x bin/install-firefox.sh
bash bin/install-firefox.sh

chmod +x bin/install-stow.sh
bash bin/install-stow.sh

cd dotfiles
stow -v -t $HOME .

echo "Reiniciando el sistema en 10 segundos..." && sleep 10 && reboot