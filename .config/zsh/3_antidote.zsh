# Optimise Antidote performance
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:static' enabled 'yes'
zstyle ':antidote:defer' enabled 'yes'

# Cache Antidote bundles for faster loading
export ANTIDOTE_HOME="$HOME/.cache/antidote"

# shellcheck disable=SC1091
source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"

# Regenerate antidote bundle cache if plugin file is newer
zsh_plugins="$HOME/.zsh_plugins.txt"
zsh_plugins_cache="$ANTIDOTE_HOME/plugins.zsh"

if [[ ! -s "$zsh_plugins_cache" ]] || [[ "$zsh_plugins" -nt "$zsh_plugins_cache" ]]; then
    antidote bundle < "$zsh_plugins" > "$zsh_plugins_cache"
fi

# shellcheck disable=SC1090
source "$zsh_plugins_cache"
