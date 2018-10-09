#!/bin/bash
clear

echo "Installing dotfiles."

# Arrays containing list of dotfiles that will be in use.
dotfile_array=( .bash_aliases .bash_profile .bashrc .bash_variables .condarc .gitconfig .tmux.conf .tmux.conf.local .vimrc )
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

# Clone dotfiles
git clone --recurse-submodules https://github.com/paddyroddy/dotfiles.git $HOME/dotfiles

# Symlink dotfiles to home directory
cd $HOME/dotfiles && stow -v \
	bash \
	conda \
	git \
	tmux \
	vim

# Remove .vim directory
if [ -d "$HOME/.vim" ]; then
	rm -rf $HOME/.vim
fi

# Clone repo for bundle plug-ins installation
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# Install VIM plugins
vim +PluginInstall! +qall

source $HOME/.bashrc 2> /dev/null
