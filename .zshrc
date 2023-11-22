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
