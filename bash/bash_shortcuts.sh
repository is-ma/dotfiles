

# [a]

# [b]
alias b="batcat"

# [c]
alias c="clear"

# [d]

# [e]

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
pe() {  # plocate, select, edit
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    vim "$file"
  fi
}
peg() {  # plocate, select, edit (global)
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    sudo vim "$file"
  fi
}
pv() {  # plocate, select, view
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    batcat "$file"
  fi
}
pvg() {  # plocate, select, view (global)
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    sudo batcat "$file"
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

