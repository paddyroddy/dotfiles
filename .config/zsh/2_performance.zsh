# shellcheck disable=SC2034
# Skip global zsh config files for faster startup
unsetopt GLOBAL_RCS

# Disable unnecessary features for faster startup
unsetopt AUTO_CD
unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP

# Optimize history settings
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# Faster globbing
setopt EXTENDED_GLOB
setopt NUMERIC_GLOB_SORT
