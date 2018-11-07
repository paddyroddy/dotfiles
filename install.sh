#!/bin/bash
clear

echo "Installing dotfiles."

# install necessary programmes
echo "Install dependencies"
if [[ $(uname -s) == Darwin ]]; then
    echo "Mac detected"

    if ! command -v brew > /dev/null; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    brew install stow
    brew install neovim
elif [[ $(uname -s) == Linux ]]; then
    echo "Linux detected"
    apt-get update
    apt-get install sudo

    echo "Ubuntu detected"
    sudo apt-get install stow neovim

    echo "Red Hat detected"
    sudo yum install stow neovim
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
nvim +PlugInstall +qall

source $HOME/.bashrc 2> /dev/null
