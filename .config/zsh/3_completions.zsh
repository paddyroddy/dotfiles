# Create cache directory for completions
[[ -d ~/.zsh/cache ]] || mkdir -p ~/.zsh/cache

autoload -Uz compinit

# Always skip security checks for trusted environment
compinit -C -d ~/.zcompdump

# Precompile for faster subsequent loads (ignore errors if not yet compilable)
zcompile ~/.zcompdump 2>/dev/null || true

# Enhanced completion caching and performance optimizations
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' menu select=2

# zsh-specific expansion
# shellcheck disable=SC2296
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

# Disable slow git completions for large repos
zstyle ':completion:*:*:git:*' script-path ~/.zsh/cache/git-completion.zsh
zstyle ':completion:*:*:git*:*' disabled-patterns '(remote-*|reflog|show-*)'
