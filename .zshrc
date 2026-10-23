## PROFILE
# time ZSH_DEBUGRC=1 zsh -i -c exit

# profiling
if [[ -n "$ZSH_DEBUGRC" ]]; then
  zmodload zsh/zprof
fi

# Only source /etc/environment if it exists and is needed
if [[ -f /etc/environment ]]; then
    source /etc/environment
fi

# Load separated config files in filename order.
for conf in "$HOME/.config/zsh/"*.zsh; do
    [[ -f "$conf" ]] || continue
    # shellcheck source=/dev/null
    source "$conf"
done
unset conf

# profiling
if [[ -n "$ZSH_DEBUGRC" ]]; then
  zprof
fi
