# ⚙️ Arch-Hyprland dotfiles

Mis **dotfiles** personales para **Hyprland** en **Arch Linux**. Este repositorio sirve como *backup* y documentación para mi configuración de escritorio actual.

## ✨ Visión General del Sistema

| Componente | Paquete/Herramienta |
| :--- | :--- |
| **Sistema Base** | Arch Linux |
| **Compositor (WM)** | [Hyprland](https://hyprland.org/) |
| **Barra de Estado** | [Waybar](https://github.com/Alexays/Waybar) |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| **Lanzador** | [Wofi](https://github.com/SimplyCEO/wofi) |
| **Bloqueo de Pantalla** | [Hyprlock](https://github.com/hyprland/hyprlock) |
| **Wallpaper utility** | [Hyprpaper](https://github.com/hyprwm/hyprpaper) |
| **Idle Management daemon** | [Hypridle](https://github.com/hyprwm/hypridle) |
| **Polkit authentication daemon** | [Hyprpolkitagent](https://github.com/hyprwm/hyprpolkitagent) |
| **Display Manager** | [SDDM](https://github.com/sddm/sddm/) |
| **Notifications daemon** | [Swaync](https://github.com/ErikReider/SwayNotificationCenter) |
| **Key Wallet Store** | [Gnome Keyring](https://wiki.gnome.org/Projects/GnomeKeyring) |
| **Tema de Colores** | [Basado en Solarized Dark](https://ethanschoonover.com/solarized/) |
---

## 💾 Restauración de la Configuración

Esta sección documenta los pasos para replicar mi entorno de escritorio desde cero, asumiendo una instalación base de Arch Linux.

### 1. Prerrequisitos

Tener **git** instalado en el sistema para poder clonar el repositorio. Para instalarlo correr `pacman`:

```bash
sudo pacman -S git
```

### 2. Clonar repo

Clonar el repo en el directorio home del usuario:

```bash
git clone https://github.com/nicolasgranata/arch-hyprland-config.git
```

### 3. Script de instalación

Ir a la carpeta arch-hyprland-config luego clonarlo y ejecutar el comando chmod para hacer el script ejecutable y correrlo

```bash
cd arch-hyprland-config
chmod +x shell-installer.sh

bash shell-installer.sh
```