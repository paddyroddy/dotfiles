# colour
alias cat='bat'
alias grep='grep --color'
alias tree='tree -C'

# safety nets
alias cp='cp -iv'
alias ln='ln -iv'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -iv'
alias wget='wget -c'

# fuzzy find
alias f='fzf-tmux'
alias vf='nvim `fzf-tmux`'

# jupyter
alias lab='jupyter lab'
alias notebook='jupyter notebook'

# visualisation
alias df='pydf'
alias du='ncdu'
alias top='htop'

# neovim
alias vim='nvim'

# matlab
alias matlab='matlab -nodesktop'

# rtyley/bfg-repo-cleaner
alias bfg='java -jar $HOME/bfg/bfg.jar'

# fix TERM issues over ssh
alias ssh='TERM=xterm-256color ssh'

# YAML visualisation
alias yless='jless --yaml'

# list directories
alias l='lsd --group-directories-first -lah'
alias la='lsd --group-directories-first -lAh'
alias ll='lsd --group-directories-first -lh'
alias ls='lsd --group-directories-first'
alias lsa='lsd --group-directories-first -lah'
alias lt='lsd --group-directories-first -lAhrt'

# navigation
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -- -='cd -'

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
