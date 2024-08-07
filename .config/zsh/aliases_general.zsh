# colour
alias cat='bat'
alias grep='grep --color'
alias ls='ls --color'
alias tree='tree -C'

# safety nets
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias ln='ln -iv'

# fuzzy find
alias f='fzf-tmux'
alias vf='nvim `fzf-tmux`'

# jupyter
alias notebook='jupyter notebook'
alias lab='jupyter lab'

# visualisation
alias top='htop'
alias du='ncdu'
alias df='pydf'

# neovim
alias vim='nvim'

# matlab
alias matlab='matlab -nodesktop'

# rtyley/bfg-repo-cleaner
alias bfg='java -jar $HOME/bfg/bfg.jar'

# python
alias pip='noglob python -m pip'

# fix TERM issues over ssh
alias ssh='TERM=xterm-256color ssh'

# YAML visualisation
alias yless='jless --yaml'

# list directories
alias la='eza --icons --group-directories-first -ahl'

# decompress all file types
x() {
    if [ -f "$1" ]; then
        case "$1" in
        *.tar.bz2) tar xvjf "$1" ;;
        *.tar.gz) tar xvzf "$1" ;;
        *.bz2) bunzip2 "$1" ;;
        *.rar) unrar x "$1" ;;
        *.gz) gunzip "$1" ;;
        *.tar) tar xvf "$1" ;;
        *.tbz2) tar xvjf "$1" ;;
        *.tgz) tar xvzf "$1" ;;
        *.zip) unzip "$1" ;;
        *.Z) uncompress "$1" ;;
        *.7z) 7z x "$1" ;;
        *) echo "Unable to extract '$1'" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
