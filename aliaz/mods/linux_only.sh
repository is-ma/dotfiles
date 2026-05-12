# Linux configs
bind 'set enable-bracketed-paste off'
sudo apt-get install -y plocate > /dev/null 2>&1  # alias: loc

# Bash only aliases
alias alib='cat ~/.is-ma/aliaz/mods/linux_only.sh && cat ~/.is-ma/aliaz/mods/any_os.sh'
alias be="vi ~/.bashrc"
alias bs="source ~/.bashrc"
alias ce='crontab -l > $HOME/my_crontab.conf && vi $HOME/my_crontab.conf && echo "Install changes with: ci."'
alias ci='crontab $HOME/my_crontab.conf && crontab -l'
alias cl="crontab -l > $HOME/my_crontab.conf && cat $HOME/my_crontab.conf"
alias e="exit"
alias g="goaccess"
alias loc="locate / | egrep -i" # Linux update db: sudo updatedb
alias mailrm="rm /var/mail/deploy"
alias mailvi="vi /var/mail/deploy"
replace () { find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s@$1@$2@g"; }
