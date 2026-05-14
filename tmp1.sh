# debian_hub
alias ci='crontab $HOME/my_crontab.conf && crontab -l'
alias cl="crontab -l > $HOME/my_crontab.conf && cat $HOME/my_crontab.conf"

# maybe
replace () { find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s@$1@$2@g"; }

# server_dotfiles
alias mailrm="rm /var/mail/deploy"
alias mailww="vi /var/mail/deploy"
