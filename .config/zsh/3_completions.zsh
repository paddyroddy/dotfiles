# Create cache directory for completions
[[ -d ~/.zsh/cache ]] || mkdir -p ~/.zsh/cache

autoload -Uz compinit

# More aggressive caching - regenerate only weekly instead of daily
# and skip security checks entirely for trusted environment
# shellcheck disable=SC1009,SC1036,SC1072,SC1073
if [[ ! -f ~/.zcompdump || -n $(find ~/.zcompdump -mtime +7) ]]; then
    # Only run full compinit weekly
    compinit -d ~/.zcompdump
    # Touch .zcompdump to reset timer
    touch ~/.zcompdump
else
    # Skip security checks for faster startup
    compinit -C -d ~/.zcompdump
fi

# Enhanced completion caching and performance optimizations
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

# Disable slow git completions for large repos
zstyle ':completion:*:*:git:*' script-path ~/.zsh/cache/git-completion.zsh
zstyle ':completion:*:*:git*:*' disabled-patterns '(remote-*|reflog|show-*)'
