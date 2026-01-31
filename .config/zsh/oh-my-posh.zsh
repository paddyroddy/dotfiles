# Cache oh-my-posh initialization
_omp_cache="$HOME/.cache/oh-my-posh-init.zsh"

# Create cache directory if it doesn't exist
[[ -d "$HOME/.cache" ]] || mkdir -p "$HOME/.cache"

# Regenerate cache if it doesn't exist or is older than oh-my-posh binary
# typos: ignore-next-line
if [[ ! -f "$_omp_cache" ]] || [[ "$_omp_cache" -ot "$(command -v oh-my-posh 2>/dev/null || echo /dev/null)" ]]; then
    oh-my-posh init zsh > "$_omp_cache" 2>/dev/null
fi

# Source the cached initialization
if [[ -f "$_omp_cache" ]]; then
    # shellcheck source=/dev/null
    source "$_omp_cache"
fi

unset _omp_cache
