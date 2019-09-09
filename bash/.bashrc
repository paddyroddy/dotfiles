# PATH
source /etc/environment

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[[ -n "$PS1" ]] && \
    [[ -s "$BASE16_SHELL/profile_helper.sh" ]] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# For Git completion
if [[ -f ~/.git-completion.bash ]]; then
    source ~/.git-completion.bash
else
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi
# For Git branch information in prompt
if [[ -f ~/.git-prompt.sh ]]; then
    source ~/.git-prompt.sh
else
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

# fuzzy find
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

# added by travis gem
[ -f /home/paddy/.travis/travis.sh ] && source /home/paddy/.travis/travis.sh

# Environment variables
if [[ -f ~/.bash_variables ]]; then
	source ~/.bash_variables
fi

# Alias definitions
if [[ -f ~/.bash_aliases ]]; then
	source ~/.bash_aliases
fi

# detect operating system
################### DARWIN  ###################
if [[ $(uname -s) == Darwin ]]; then
	# anaconda
	source /usr/local/anaconda3/etc/profile.d/conda.sh
	
	# fix tmux conda activate issue
	if ! [[ -z ${TMUX+x} ]]; then
		conda deactivate
	fi
elif [[ $(uname -s) == Linux ]]; then
	# anaconda
	source $HOME/anaconda3/etc/profile.d/conda.sh
fi
conda activate py37

# test if linuxbrew is installed i.e. cluster
if [[ -d ~/.linuxbrew ]]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
