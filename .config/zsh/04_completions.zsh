# Put styles in place before compinit installs the completion system.
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' menu select=2
# shellcheck disable=SC2296
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

[[ -d "$HOME/.zsh/cache" ]] || command mkdir -p "$HOME/.zsh/cache"

# Do not use compinit -C: it skips the checks that can catch unsafe completion
# directories. compinit itself decides whether the existing dump is reusable.
autoload -Uz compinit
compinit -d "$HOME/.zcompdump"

# Disable slow git completions for large repos
zstyle ':completion:*:*:git:*' script-path ~/.zsh/cache/git-completion.zsh
zstyle ':completion:*:*:git*:*' disabled-patterns '(remote-*|reflog|show-*)'
