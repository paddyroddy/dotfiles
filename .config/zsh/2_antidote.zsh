# Cache antidote bundles for faster loading
export ANTIDOTE_HOME="$HOME/.cache/antidote"
# shellcheck disable=SC1091
source "$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh"

# Only regenerate if plugins file is newer than the cache
zsh_plugins="$HOME/.zsh_plugins.txt"
zsh_plugins_cache="$ANTIDOTE_HOME/plugins.zsh"

if [[ ! -f "$zsh_plugins_cache" || "$zsh_plugins" -nt "$zsh_plugins_cache" ]]; then
    antidote bundle < "$zsh_plugins" > "$zsh_plugins_cache"
fi
# shellcheck disable=SC1091
source "$zsh_plugins_cache"
