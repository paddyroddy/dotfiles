# PATH
source /etc/environment

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER="$(whoami)"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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
    asdf
    common-aliases
    git
    zsh-syntax-highlighting
)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

# fuzzy find
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Environment variables
if [[ -f ~/.zsh_variables ]]; then
    source ~/.zsh_variables
fi

# Alias definitions
if [[ -f ~/.zsh_aliases ]]; then
    source ~/.zsh_aliases
fi

# anaconda
source $HOME/miniconda3/etc/profile.d/conda.sh
conda activate py39

# test if linuxbrew is installed i.e. cluster
if [[ -d ~/.linuxbrew ]]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
fi

# bitwarden
eval "$(bw completion --shell zsh); compdef _bw bw;"
