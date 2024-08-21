# sharkdp/fd for junegunn/fzf
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"

# Install in .local directory
export PATH="$HOME/.local/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# zsh-autosuggestions
# shellcheck disable=SC2034
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"

# rust
# shellcheck disable=SC1091
source "$HOME/.cargo/env"

# tmux plugin
# shellcheck disable=SC2034
ZSH_TMUX_AUTOSTART=true
