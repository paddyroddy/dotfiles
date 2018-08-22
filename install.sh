#!/bin/bash
clear

echo "Installing dotfiles."

# Arrays containing list of dotfiles that will be in use.
dotfile_array=( .bash_aliases .bash_profile .bashrc .condarc .gitconfig .tmux.conf .vimrc )
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
git clone https://github.com/paddyroddy/dotfiles.git

# Symlink dotfiles to home directory
cd dotfiles && stow -v \
	bash \
	conda \
	git \
	tmux \
	vim

# Clone repo for bundle plug-ins installation
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install VIM plugins
vim +PluginInstall! +qall

source $HOME/.bashrc 2> /dev/null
