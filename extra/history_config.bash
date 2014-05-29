# -------------------------
# Bash options for history
# -------------------------

# Append to the history file, don't overwrite it
shopt -s histappend >/dev/null 2>&1

# Don't put duplicate lines in the history.
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# Setting history length see HISTSIZE and HISTFILESIZE
HISTSIZE=10000
HISTFILESIZE=4000

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd;exit:date:* --help"

