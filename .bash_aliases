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

# fuzzy find https://github.com/junegunn/fzf
if [ `ps aux | grep 'tmux' | awk 'FNR == 2 {print $2}'` > 0 ]; then
	alias f='fzf-tmux'
else
	alias f='fzf'
fi

# jupyter
alias notebook='jupyter notebook'
