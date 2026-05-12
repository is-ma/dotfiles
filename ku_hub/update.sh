# mouse Logitech M575s
cp ~/.m575s_config.sh ~/.is-ma/ku_hub/mouse/m575s_config.sh

# keyboard Logitech K380
cp ~/.k380_config.sh ~/.is-ma/ku_hub/keyboards/k380_config.sh

# cronjobs
crontab -l > ~/.is-ma/ku_hub/system/cronjobs.txt

# sudoers (440 to 644 for backup only)
sudo cp /etc/sudoers ~/.is-ma/ku_hub/system/sudoers
sudo chmod 644 ~/.is-ma/ku_hub/system/sudoers

# fonts
cp -r ~/.local/share/fonts/menlo/ ~/.is-ma/ku_hub/fonts/

# tabby
cp ~/.config/tabby/config.yaml ~/.is-ma/ku_hub/tabby/

# konsole
cp ~/.local/share/konsole/Rich.profile ~/.is-ma/ku_hub/konsole/
cp ~/.local/share/konsole/GruvboxForKonsole.colorscheme ~/.is-ma/ku_hub/konsole/

# wallpapers
cp ~/.local/share/wallpapers/green_blackboard.jpg ~/.is-ma/ku_hub/wallpapers/

# Gruvbox
## System Settings > Download New Global Themes > Gruvbox Look and Feel by adhe
## Application Style: Breeze
## Plasma Style: Breeze
## Colors: Gruvbox Colors
## Window Decorations: Breeze
## Icons: Gruvbox
## Cursors: Oxygen Zion
## Splash Screen: GruvboxPlasma
## Boot Splash Screen: Breeze (Text Mode)
#cp ~/.local/share/color-schemes/GruvboxColors.colors ~/.is-ma/ku_hub/themes/Gruvbox/
#cp -r ~/.local/share/plasma/desktoptheme/GruvboxPlasma/ ~/.is-ma/ku_hub/themes/Gruvbox/
#cp -r ~/.local/share/icons/Gruvbox/ ~/.is-ma/ku_hub/themes/Gruvbox/icons/
#cp -r ~/.local/share/aurorae/themes/GruvboxAurorae/ ~/.is-ma/ku_hub/themes/Gruvbox/
#sudo cp -r /usr/share/icons/Capitaine-Gruvbox/ ~/.is-ma/ku_hub/themes/Gruvbox/cursors/

# Battery [60, 80]% (en ASUS X1404ZA sólo lo fija en 80%)
sudo cp /etc/tlp.conf ~/.is-ma/ku_hub/system/battery80.conf
sudo chown rich:rich ~/.is-ma/ku_hub/system/battery80.conf 
#sudo tlp start    # start service
#sudo tlp-stat -b  # view service

