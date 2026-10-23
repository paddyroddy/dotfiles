# shellcheck disable=SC1009,SC1035,SC1072,SC1073
# Antidote configuration
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:static' enabled 'yes'
zstyle ':antidote:defer' enabled 'yes'
zstyle ':antidote:compile' enabled 'yes'

export ANTIDOTE_HOME="$HOME/.cache/antidote"

zsh_plugins="$HOME/.config/zsh/plugins.txt"
zsh_plugins_cache="$ANTIDOTE_HOME/plugins.zsh"
antidote_script="${HOMEBREW_PREFIX:+$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh}"
[[ -n "$antidote_script" && ! -r "$antidote_script" ]] && antidote_script=""
[[ -z "$antidote_script" && -r "$HOME/.local/share/antidote/antidote.zsh" ]] && antidote_script="$HOME/.local/share/antidote/antidote.zsh"

# Load the bundle synchronously so kind:fpath plugins are available to compinit.
if [[ -s "$zsh_plugins_cache" ]]; then
    # shellcheck source=/dev/null
    source "$zsh_plugins_cache"
fi

# Regenerate stale bundles synchronously on first run. A background writer could
# otherwise leave the next shell with a partial or mismatched plugin bundle.
# typos: ignore-next-line
if [[ -r "$zsh_plugins" && ( ! -s "$zsh_plugins_cache" || "$zsh_plugins_cache" -ot "$zsh_plugins" ) ]]; then
    if [[ -r "$antidote_script" ]]; then
        # shellcheck source=/dev/null
        source "$antidote_script"
        if antidote bundle < "$zsh_plugins" > "$zsh_plugins_cache.tmp"; then
            mv "$zsh_plugins_cache.tmp" "$zsh_plugins_cache"
            # shellcheck source=/dev/null
            source "$zsh_plugins_cache"
        else
            rm -f "$zsh_plugins_cache.tmp"
        fi
    fi
fi
unset antidote_script zsh_plugins zsh_plugins_cache
