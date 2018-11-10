#!/bin/bash
clear

echo "Installing dotfiles."

# check stow & neovim are installed
if ! command -v stow nvim > /dev/null; then
    # install necessary programmes
    echo "Install dependencies"

    # if mac
    if [[ $(uname -s) == Darwin ]]; then
        echo "Mac detected"

        # install homebrew
        if ! command -v brew > /dev/null; then
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
    # if linux
    elif [[ $(uname -s) == Linux ]]; then
        echo "Linux detected"

        # install linuxbrew
        if ! command -v brew > /dev/null; then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

            test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
            test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
            test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
            echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
        fi
    fi

    # install stow & neovim
    brew install stow
    brew install neovim
fi

# Arrays containing list of dotfiles that will be in use.
dotfile_array=( .bash_aliases .bash_profile .bashrc .bash_variables .condarc .gitconfig init.vim .tmux.conf .tmux.conf.local )
# Check users home directory for existing dotfiles and create a backup version.
for i in ${dotfile_array[*]}
do
	# check dotfile exists
	if [ -f "$HOME/$i" ]; then
		# create .backup dir if doesn't exist
		if [ ! -d "$HOME/.backup" ]; then
			mkdir $HOME/.backup
		fi
		# create backup
		echo "Creating backup of existing" $i
		mv $HOME/$i $HOME/.backup/
	else
		echo $i "not found"
	fi
done

# Remove .config/nvim directory
if [ -d "$HOME/.config/nvim" ]; then
	rm -rf $HOME/.config/nvim
fi

# Clone dotfiles
git clone --recurse-submodules https://github.com/paddyroddy/dotfiles.git $HOME/dotfiles

# Symlink dotfiles to home directory
cd $HOME/dotfiles && stow -v \
	bash \
	conda \
	git \
	neovim \
	tmux

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nvim plugins
nvim --headless +PlugInstall +0cquit

source $HOME/.bashrc 2> /dev/null
