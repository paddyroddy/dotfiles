#!/bin/zsh
clear

echo "Installing dotfiles."

case "$OSTYPE" in
    darwin*)
        echo "Mac detected"
        conda_prefix=/usr/local/anaconda3

        # install homebrew
        if ! command -v brew > /dev/null; then
            echo "homebrew not detected, please install"
            exit	
        else
            echo "homebrew detected"
            brew update
        fi
    ;;
    linux*)
        echo "Linux detected"
        conda_prefix="$HOME/anaconda3"

        sudo -n true
        if [[ $? != 0 ]] ; then
            echo "you don't have sudo rights"
    
            # install linuxbrew
            if ! command -v brew > /dev/null; then
                echo "homebrew not detected, please install"
            exit	
            else
                echo "homebrew detected"
                brew update
            fi
        else
            echo "sudo rights detected"
        fi
    ;;
esac

# anaconda
if ! command -v ${conda_prefix}/bin/conda > /dev/null; then
    echo "anaconda not detected, please install"
    exit	
else
    echo "anaconda detected"
    
    if ! command -v ${conda_prefix}/envs/py37/bin/python > /dev/null; then
        echo "creating conda environment py37"
	${conda_prefix}/bin/conda create -n py37 python=3.7 -y
    fi
fi

if ! command -v stow nvim  > /dev/null; then
    echo "dependencies not detected:"
    echo "stow nvim" 
    exit	
else
    echo "dependencies detected"
fi

# Arrays containing list of dotfiles that will be in use.
dotfile_array=( .condarc .gitconfig init.vim .tmux.conf .tmux.conf.local .zsh_aliases .zsh_variables .zshrc)
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
	conda \
	git \
	neovim \
	tmux \
    zsh

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nvim plugins
nvim +PlugInstall +qa

source $HOME/.zshrc
