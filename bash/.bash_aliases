# detect operating system

################### LINUX ###################
if [[ $(uname -s) == Linux ]]; then
	#
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
	#
################### DARWIN ###################
elif [[ $(uname -s) == Darwin ]]; then
	#
	# remove clang
	alias gcc='gcc-8'
	alias cc='gcc-8'
	alias g++='g++-8'
	alias c++='c++-8'

	# after update
	alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'
	#
fi

# colour
alias ls='ls --color'
alias grep='grep --color'

# fuzzy find
alias f='fzf-tmux'
alias vimf='vim `fzf-tmux`'

# jupyter
alias notebook='jupyter notebook'
