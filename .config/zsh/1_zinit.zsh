# shellcheck source=/dev/null
source "$(brew --prefix)"/opt/zinit/zinit.zsh

# zsh plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

# zsh snippets
zinit snippet OMZP::asdf
zinit snippet OMZP::git

# load completions
autoload -Uz compinit && compinit
zinit cdreplay -q
