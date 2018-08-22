# detect operating system
# linux
if [[ $(uname -s) == Linux ]]; then
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
fi

# remove clang
alias gcc='gcc-8'
alias cc='gcc-8'
alias g++='g++-8'
alias c++='c++-8'

# colour
alias ls='ls --color'
alias grep='grep --color'

# after update
alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'

# fuzzy find
alias f='fzf-tmux'

# jupyter
alias notebook='jupyter notebook'
