# >>> conda initialize >>>
__conda_setup=$("$HOME/miniforge3/bin/conda" shell.zsh hook 2> /dev/null)
# shellcheck disable=SC2181
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
        # shellcheck source=/dev/null
        source "$HOME/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "$HOME/miniforge3/etc/profile.d/mamba.sh" ]; then
    # shellcheck source=/dev/null
    source "$HOME/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
export MAMBA_NO_BANNER=1
conda activate
