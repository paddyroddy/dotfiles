# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/paddy/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/paddy/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/paddy/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/paddy/.fzf/shell/key-bindings.zsh"
