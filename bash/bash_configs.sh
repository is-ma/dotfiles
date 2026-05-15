# bash stuff
HISTCONTROL=ignoreboth       # don't put duplicate lines in history
HISTFILESIZE=20000           # remember 10000 commands [HDD]
HISTSIZE=1000                # remember 5000 commands [RAM]
PROMPT_COMMAND="history -a"  # persist commands to my ~/.bash_history
export EDITOR="vim"          # use it as default (ex. git)
set -o vi                    # edit command-line with VI

# tools

