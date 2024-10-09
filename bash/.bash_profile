
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mfyx/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mfyx/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mfyx/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mfyx/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"
