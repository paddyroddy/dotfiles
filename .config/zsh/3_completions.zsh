# Create cache directory for completions
[[ -d ~/.zsh/cache ]] || mkdir -p ~/.zsh/cache

autoload -Uz compinit

# Only regenerate completion dump once per day (instead of checking on every startup)
# shellcheck disable=SC1036
_comp_files=($HOME/.zcompdump(Nm-20))
if (( $#_comp_files )); then
    # Dump is recent enough, skip security checks
    compinit -C -d ~/.zcompdump
else
    # Dump is old or doesn't exist, regenerate with checks
    compinit -d ~/.zcompdump
fi
unset _comp_files

# Precompile for faster subsequent loads (do in background to avoid blocking)
# shellcheck disable=SC1035,SC1072,SC1083
{ zcompile ~/.zcompdump 2>/dev/null } &!

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
