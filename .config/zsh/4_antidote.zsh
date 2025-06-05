# shellcheck disable=SC1009,SC1035,SC1072,SC1073
# Enhanced Antidote performance settings
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:static' enabled 'yes'
zstyle ':antidote:defer' enabled 'yes'
zstyle ':antidote:compile' enabled 'yes'

# Cache Antidote bundles for faster loading
export ANTIDOTE_HOME="$HOME/.cache/antidote"

# Lazy load antidote to avoid blocking shell startup
_antidote_lazy_load() {
    unfunction antidote
    # shellcheck disable=SC1091
    source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
    antidote "$@"
}

# Only initialize antidote if plugins need updating
zsh_plugins="$HOME/.config/zsh/plugins.txt"
zsh_plugins_cache="$ANTIDOTE_HOME/plugins.zsh"

if [[ -s "$zsh_plugins_cache" ]] && [[ "$zsh_plugins_cache" -nt "$zsh_plugins" ]]; then
    # Plugins are up to date, just source the cache
    # shellcheck disable=SC1090
    source "$zsh_plugins_cache"
else
    # Need to regenerate - do this in background after shell loads
    if [[ -s "$zsh_plugins_cache" ]]; then
        # Source existing cache first for immediate functionality
        # shellcheck disable=SC1090
        source "$zsh_plugins_cache"
    fi

    # Regenerate in background
    {
        # shellcheck disable=SC1091
        source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
        antidote bundle < "$zsh_plugins" > "$zsh_plugins_cache.tmp" && \
        mv "$zsh_plugins_cache.tmp" "$zsh_plugins_cache"
    } &!
fi
