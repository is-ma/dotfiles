# install i3
sudo apt install -y i3 dmenu i3status i3lock

# config
cd ~/is-ma/dothub/dotfiles/i3/
stow -t ~/.config/i3/ i3_files/

# launch
startx /usr/bin/i3

