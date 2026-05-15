# DEBIAN 13

- instalación en disco completo
- root: ElNido*
- rich: MD5 AU[-4]
- time zone: Central
- Sin swap por el momento:
  * 1 GB B F ESP
  * 511.1 F ext4 /
- SSH server
- standard system utilities 


## GRUB
- en la ASUS X1404ZA fallará al final de la instalación
- Debian 13 se instala completamente aún así
- al final te sacará directo al GRUB (terminal)

Te dirá algo así como que voy a requerir después hacer boot manual con vmlinuz kernel en partición /dev/nvme0n1p2 y root=/dev/nvme0n1p2 quiet passed as kernel argument y justo así DeepSeek me dio los siguientes comandos que arreglaron completamente el problema:

```bash
# Para encontrar tu partición Debian
ls

# Busca la que tenga ext4 (ej. (hd0,gpt2))
set root=(hd0,gpt2)

# Carga el kernel (presiona TAB para autocompletar)
linux /boot/vmlinuz-... root=/dev/nvme0n1p2

# Carga el initrd
initrd /boot/initrd.img-...

# Arranca
boot
```

Ahora vamos a hacer que estos cambios sean permanentes:
```bash
# Genera el archivo /boot/grub/grub.cfg
sudo update-grub

# Reinstala GRUB en el disco (para que apunte bien)
sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --removable

# Verifica que el archivo se creó
ls -l /boot/grub/grub.cfg

# Reinicia y prueba
sudo reboot
```

## SWAP
4GB de SWAP
```bash
su -
dd if=/dev/zero of=/swapfile bs=1M count=4096 status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

# Que sea permanente, añade al final de tu /etc/fstab:
/swapfile none swap sw 0 0

# Que solo se use si es emergencia:
vi /etc/sysctl.conf
vm.swappiness=10

# Que se entere del cambio:
sudo sysctl -p
```


## SUDO
Debian no instalará sudo ni añadirá a tu usuario al grupo de administradores por defecto.

La solución: Tienes que entrar como root (su -), instalar sudo (apt install sudo) y añadir a "Rich" al grupo: `usermod -aG sudo rich`.

Instala: `apt install sudo`.

Cierra la sesión de usuario con `exit`.

Para forzar la actualización de grupos sin reiniciar ejecuta como rich `newgrp sudo`.

Test: `sudo ls`.


## i3
```bash
sudo apt install -y i3
sudo apt install -y xinit
startx /usr/bin/i3
```


## VIM real
Debian instala una versi'on `tiny`, instala un VIM real
```bash
sudo apt install vim
```

Config mínima de VIM (`vi ~/.vimrc`):
```bash
" Activar el resaltado de sintaxis
syntax on

" Detectar el tipo de archivo
filetype plugin indent on

" Intentar cargar el esquema desert (que ya vendrá con la versión completa)
colorscheme desert

" Si prefieres un fondo oscuro para que no te queme la vista
set background=dark

" Resaltar la línea actual
set cursorline
```


## CONTRIB
Habilita los repositorios *contrib*. Agrega `contrib` a cada línea deb (no es necesario en las líneas deb-src, a menos que quieras los fuentes).

*contrib*: Contiene paquetes que cumplen con las directrices de Debian pero dependen de software que no es completamente libre.

```bash
sudo vi /etc/apt/sources.list

# ej. para las 3 líneas deb:
# deb http://deb.debian.org/debian/ trixie main contrib non-free-firmware

```

Guarda los cambios, luego `sudo apt update`.


## APT
### Git
sudo apt install git
git config --global user.email "is-ma@users.noreply.github.com"
git config --global user.name "Is Ma"


## Alacritty
### Dependencias
sudo apt install libfontconfig1-dev
### Instala Rust primero
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
cargo install alacritty


### i3 Window Manager
sudo apt install i3

