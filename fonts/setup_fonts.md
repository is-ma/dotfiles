# install fonts (and verify) | Nerd Fonts v3.4.0
mkdir -p ~/.local/share/fonts/
cd ~/is-ma/dothub/dotfiles/fonts/
stow -t ~/.local/share/fonts/ font_files/
fc-cache -fv
fc-list | grep -i "Meslo"  

