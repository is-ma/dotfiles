# install i3 (duda con xinit, evito dmenu)
sudo apt install -y i3 i3status i3lock xinit

# config
stow -t ~/.config/i3/ i3_files/

# custom i3status
stow -t ~/.config/i3status/ i3status_files/

# rofi ($mod+d, $mod+Shift+d)
sudo apt install -y rofi
stow -t ~/.config/rofi/ rofi_files/

# notifications
sudo apt install -y libnotify-bin dunst

# xrandr ($mod+i, $mod+n, $mod+p)
sudo apt install -y x11-xserver-utils

# launch
startx /usr/bin/i3

# firefox
sudo apt install -y firefox-esr

