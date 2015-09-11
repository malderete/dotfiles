# -------------
# Bash Options
# -------------

#Set Spelling check on cd
shopt -s cdspell >/dev/null 2>&1
#Set Extended pattern matching
shopt -s extglob >/dev/null 2>&1
#Set Interactive shell on (we can #comment on bash)
shopt -s interactive_comments >/dev/null 2>&1
#Disable mail alert
shopt -u mailwarn >/dev/null 2>&1

# Disable the 'You have an email' message
unset MAILCHECK

