## PROFILE
# time ZSH_DEBUGRC=1 zsh -i -c exit

# profiling
if [[ -n "$ZSH_DEBUGRC" ]]; then
  zmodload zsh/zprof
fi

# create default path
source /etc/environment
MANPATH=$(sed -e 's/export PATH=//' < /etc/environment)
export MANPATH=$MANPATH

# Load separated config files
for conf in "$HOME/.config/zsh/"*.zsh; do
    # shellcheck source=/dev/null
    source "$conf"
done
unset conf

# profiling
if [[ -n "$ZSH_DEBUGRC" ]]; then
  zprof
fi
