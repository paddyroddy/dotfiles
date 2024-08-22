# Install in .local directory
export PATH="$HOME/.local/bin:$PATH"

# zsh-autosuggestions
# shellcheck disable=SC2034
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"

# tmux plugin
# shellcheck disable=SC2034
ZSH_TMUX_AUTOSTART=true

# zsh-autocomplete
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
