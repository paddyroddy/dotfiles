# detect operating system

################### LINUX ###################
if [[ $(uname -s) == Linux ]]; then
	# copy & paste
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
	
	# open pdfs
	alias open='xdg-open'

    # update
    if [[ -d ~/.linuxbrew ]]; then
        alias brewski='brew update && brew upgrade && brew cleanup; brew doctor; conda update --all -y && conda clean --all -y'
    else
        alias brewski='sudo sh -c "apt -y update;apt -y dist-upgrade;apt -y autoremove;apt -y autoclean"; conda update --all -y && conda clean --all -y'
    fi
################### DARWIN ###################
elif [[ $(uname -s) == Darwin ]]; then
	# remove clang
	alias gcc='gcc-8'
	alias cc='gcc-8'
	alias g++='g++-8'
	alias c++='c++-8'

	# update
	alias brewski='brew update && brew upgrade && brew cleanup; brew doctor; conda update --all -y && conda clean --all -y'
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

# safety nets
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias ln='ln -iv'

# visualisation
alias top='htop'
alias du='ncdu'
alias df='pydf'

# the fuck
eval $(thefuck --alias)

# conda environments
alias py27='conda activate py27'
alias py37='conda activate py37'

# find chmod code
alias permissions="stat -c '%a %n'"

# search history
alias hs='history'
alias hg='history | grep'

# hidden files
alias la='ls -lah'

# matlab
alias matlab='matlab -nodesktop'

# rtyley/bfg-repo-cleaner
alias bfg='java -jar $HOME/bfg/bfg.jar'
