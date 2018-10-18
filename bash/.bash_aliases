# detect operating system

################### LINUX ###################
if [[ $(uname -s) == Linux ]]; then
	# copy & paste
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
	
	# open pdfs
	alias open='xdg-open'

    # update
    alias brewski='sudo sh -c "apt -y update;apt -y dist-upgrade;apt -y autoremove;apt -y autoclean"'
################### DARWIN ###################
elif [[ $(uname -s) == Darwin ]]; then
	# remove clang
	alias gcc='gcc-8'
	alias cc='gcc-8'
	alias g++='g++-8'
	alias c++='c++-8'

	# after update
	alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'
fi

# colour
alias ls='ls --color'
alias grep='grep --color'

# fuzzy find
alias f='fzf-tmux'
alias vimf='vim `fzf-tmux`'

# jupyter
alias notebook='jupyter notebook'
alias lab='jupyter lab'

# neovim
alias vim='nvim'
