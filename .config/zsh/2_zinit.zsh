# shellcheck disable=SC1091
source "$(brew --prefix)"/opt/zinit/zinit.zsh

# zsh plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

# zsh snippets
zinit snippet OMZP::git

# load completions
autoload -Uz compinit && compinit
zinit cdreplay -q
