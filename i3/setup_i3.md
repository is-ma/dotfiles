# install i3
sudo apt install -y i3 dmenu i3status i3lock

# config
stow -t ~/.config/i3/ i3_files/

# custom i3status
stow -t ~/.config/i3status/ i3status_files/

# launch
startx /usr/bin/i3

# rofi
sudo apt install -y rofi
stow -t ~/.config/rofi/ rofi_files/

# notifications
sudo apt install -y libnotify-bin dunst

# network manager - uses nmcli (90302dd, 2024/Sep/02)
# https://github.com/meowrch/rofi-network-manager
sudo apt install -y network-manager
# bluetooth - uses bluetoothctl (0cca4d4, 2025/Apr/14)
# https://github.com/nickclyde/rofi-bluetooth
# 1. El Motor (Hardware y Protocolo)
sudo apt install -y bluez libspa-0.2-bluetooth
# 2. El Sonido (Infraestructura de Audio)
sudo apt install -y pipewire pipewire-pulse wireplumber
# 3. Autorización y Activación
sudo usermod -aG bluetooth $USER
systemctl --user enable --now pipewire pipewire-pulse wireplumber

stow -t ~/.local/bin/ bin_files/

