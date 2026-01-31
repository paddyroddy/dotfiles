# shellcheck disable=SC1009,SC1035,SC1072,SC1073
# Antidote configuration
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:static' enabled 'yes'
zstyle ':antidote:defer' enabled 'yes'
zstyle ':antidote:compile' enabled 'yes'

export ANTIDOTE_HOME="$HOME/.cache/antidote"

# Lazy-load antidote only when regenerating; otherwise source the cache immediately
_antidote_lazy_load() {
    unfunction antidote
    source "$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh"
    antidote "$@"
}

zsh_plugins="$HOME/.config/zsh/plugins.txt"
zsh_plugins_cache="$ANTIDOTE_HOME/plugins.zsh"

# Source existing cache NOW so that `kind:fpath` (zsh-completions)
# changes $fpath before compinit
if [[ -s "$zsh_plugins_cache" ]]; then
    source "$zsh_plugins_cache"
fi

# Regenerate cache in background if outdated
# typos: ignore-next-line
if [[ ! -s "$zsh_plugins_cache" || "$zsh_plugins_cache" -ot "$zsh_plugins" ]]; then
    {
        source "$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh"
        antidote bundle < "$zsh_plugins" > "$zsh_plugins_cache.tmp" && \
        mv "$zsh_plugins_cache.tmp" "$zsh_plugins_cache"
    } &!
fi
