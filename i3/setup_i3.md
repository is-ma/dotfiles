# install i3
sudo apt install -y i3 dmenu i3status i3lock

# rofi
sudo apt install -y rofi

# notifications
sudo apt install -y libnotify-bin dunst  # notifications

# network manager - uses nmcli (90302dd, 2024/Sep/02)
# https://github.com/meowrch/rofi-network-manager
stow -t ~/.local/bin/ i3_net_files/

# rofi / networks / audio / bluetooth
sudo apt install -y rofi network-manager-applet pulsemixer

# network applet
sudo apt install -y network-manager network-manager-applet

# bluetooth
sudo apt install -y bluez blueman pipewire wireplumber libspa-0.2-bluetooth
sudo usermod -aG bluetooth,lp $USER
systemctl --user enable --now pipewire pipewire-pulse wireplumber

# config
cd ~/is-ma/dothub/dotfiles/i3/
stow -t ~/.config/i3/ i3_files/

# launch
startx /usr/bin/i3

