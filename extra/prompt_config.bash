# -------------------------
# Bash options for prompt
# -------------------------


# Disable default virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1


BASH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="("
BASH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=")"


_get_virtualenv_prompt() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo "$BASH_THEME_VIRTUAL_ENV_PROMPT_PREFIX$name$BASH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
    fi
}


python_interpreter_like_prompt() {
    # (Virtualenv)user@host in ~/working_path |git_branch_status|

    PS1="${YELLOW_B}$(_get_virtualenv_prompt)${GREEN_B}\u${BLUE_B}@${RED_B}\h${WHITE_B} in ${BLUE_B}\w${CYAN} $(__git_ps1 "|%s|")${GREEN_B} $\n${GREEN_B}>>>\[\033[00m\] "
}

# Set the prompt
PROMPT_COMMAND=python_interpreter_like_prompt

