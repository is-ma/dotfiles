# install fonts (and verify)
mkdir -p ~/.local/share/fonts/
cd ~/is-ma/dothub/dotfiles/fonts/
stow -t ~/.local/share/fonts/ font_files/
fc-cache -fv
fc-list | grep -i "Meslo"

