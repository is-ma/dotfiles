

# [a]

# [b]
alias b="batcat"

# [c]
alias c="clear"

# [d]

# [e]

# [f]

# [g]
alias grep="grep --color=always"

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
p() {  # instant find (plocate), select, open
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    vim "$file"
  fi
}
pa() {  # instant find (plocate), select, open (SUDO)
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    sudo vim "$file"
  fi
}
alias pu="sudo updatedb"  # updates plocate db manually (instead of 1/day)

# [q]

# [r]

# [s]
alias s="source ~/.bashrc"
alias su="echo ''; su"
sumcol(){ awk "{s+=\$$1} END {print s}"; }  # sum numbers in column n

# [t]

# [u]

# [v]
alias v="vim"
alias vi="vim"

# [w]
wo () { whois $1 | egrep "^   (Admin|Creation|Updated)"; }

# [x]

# [y]

# [z]

