# bash stuff
HISTCONTROL=ignoreboth       # don't put duplicate lines in history
HISTFILESIZE=10000           # now we can remember 10000 commands [HDD] (not 2000)
HISTSIZE=5000                # now we can remember 5000 commands [RAM] (not 1000)
PROMPT_COMMAND='history -a'  # immediately persist commands to my ~/.bash_history
set -o vi                    # edit command-line with VI

# tools

