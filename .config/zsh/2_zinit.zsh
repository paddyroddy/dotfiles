# shellcheck disable=SC2034
# Initialize completion system first
autoload -Uz compinit
compinit

# https://github.com/zdharma-continuum/zinit#manual
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME"/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# shellcheck disable=SC1091
source "${ZINIT_HOME}/zinit.zsh"

# Since we sourced zinit.zsh after compinit
autoload -Uz _zinit
# shellcheck disable=SC2154
(( ${+_comps} )) && _comps[zinit]=_zinit

# plugins that don't need to be immediately available
zinit ice wait lucid light-mode
zinit snippet OMZP::git
zinit ice wait lucid light-mode
zinit snippet OMZP::tmux
zinit ice wait lucid light-mode
zinit light Aloxaf/fzf-tab
zinit ice wait lucid light-mode
zinit light zsh-users/zsh-autosuggestions
zinit ice wait lucid light-mode
zinit light zsh-users/zsh-completions


# Note: zsh-syntax-highlighting often needs to be loaded without 'wait'
zinit ice blockf
zinit light zsh-users/zsh-syntax-highlighting

# Replay cached completions
zinit cdreplay -q