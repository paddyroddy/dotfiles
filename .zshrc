# create default path
source /etc/environment
export MANPATH=`cat /etc/environment | sed -e 's/export PATH=//'`

# Load seperated config files
for conf in "$HOME/.config/zsh/*.zsh"; do
  source "${conf}"
done
unset conf
