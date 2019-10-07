# PATH
source /etc/environment

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="agnoster"
DEFAULT_USER="`whoami`"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    brew
    common-aliases
    command-not-found
    docker
    git
    tmux
)

source $ZSH/oh-my-zsh.sh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[[ -n "$PS1" ]] && \
    [[ -s "$BASE16_SHELL/profile_helper.sh" ]] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# fuzzy find
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# Environment variables
if [[ -f ~/.zsh_variables ]]; then
	source ~/.zsh_variables
fi

# Alias definitions
if [[ -f ~/.zsh_aliases ]]; then
	source ~/.zsh_aliases
fi

# detect operating system
case "$OSTYPE" in
    darwin*)
        # anaconda
        source /usr/local/anaconda3/etc/profile.d/conda.sh
    ;;
    linux*)
        # anaconda
        source $HOME/anaconda3/etc/profile.d/conda.sh
    ;;
esac
conda activate py37

# test if linuxbrew is installed i.e. cluster
if [[ -d ~/.linuxbrew ]]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
fi