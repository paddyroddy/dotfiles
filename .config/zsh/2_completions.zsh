# Create cache directory for completions
[[ -d ~/.zsh/cache ]] || mkdir -p ~/.zsh/cache

autoload -Uz compinit

# Regenerate compdump if it doesn't exist or is older than 24 hours.
# Subsequent shell starts will skip security checks for speed.
# IMPORTANT: Ensure your fpath contains only trusted directories when skipping compaudit.
if [[ ! -s ~/.zcompdump ]] || [[ -n ~/.zcompdump(#qNmh+24) ]]; then
    compinit -d ~/.zcompdump
else
    compinit -C -d ~/.zcompdump
fi

# Completion caching and performance optimizations
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
