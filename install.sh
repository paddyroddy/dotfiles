#!/bin/bash
clear

echo "Installing dotfiles."

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
