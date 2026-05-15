

# [a]

# [b]
alias b="batcat"

# [c]
alias c="clear"

# [d]

# [e]
alias e="vim"
ee() {  # plocate && edit
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    vim "$file"
  fi
}
ee0() {  # plocate && edit (global)
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    sudo vim "$file"
  fi
}

# [f]

# [g]

# [h]
alias h="history | grep -E"

# [i]
alias i="cd ~/is-ma/ && ls -F"
alias ipull='back=$(pwd); cd ~/is-ma/ && for repo in */; do cd $repo; echo -n "----- ----- ----- ----- $repo"; git for-each-ref --format="%(push:track)" refs/heads; git pull; gs; cd ..; done; cd $back'

# [j]

# [k]

# [l]
alias ll="ls -AlFh"
alias ls="ls -F"

# [m]

# [n]
alias n="nvim"

# [o]

# [p]

# [q]
alias q="exit"

# [r]
alias r='RIPGREP_CONFIG_PATH=/home/rich/is-ma/dotfiles/rg/rg.conf rg'
alias r0='sudo RIPGREP_CONFIG_PATH=/home/rich/is-ma/dotfiles/rg/rg.conf rg'

# [s]
alias s="source ~/.bashrc"
alias su="echo ''; su"
sumcol(){ awk "{s+=\$$1} END {print s}"; }  # sum numbers in column n

# [t]

# [u]
alias uu="sudo updatedb"  # updates plocate db manually (instead of 1/day)

# [v]
alias vi="vim"

# [w]
ww() {  # plocate && read
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    batcat "$file"
  fi
}
ww0() {  # plocate && read (global)
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    sudo batcat "$file"
  fi
}
wo () { whois $1 | egrep "^   (Admin|Creation|Updated)"; }

# [x]

# [y]

# [z]

