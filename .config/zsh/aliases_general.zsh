# Colour aliases
alias cat='bat'
alias grep='grep --color'
alias tree='tree -C'

# Safety aliases for common commands
alias cp='cp -iv'
alias ln='ln -iv'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -iv'
alias wget='wget -c'

# Fuzzy find aliases
alias f='fzf-tmux'
alias vf='nvim `fzf-tmux`'

# Jupyter aliases
alias lab='jupyter lab'
alias notebook='jupyter notebook'

# System visualization tools
alias df='pydf'
alias du='ncdu'
alias top='htop'

# Neovim alias
alias vim='nvim'

# Matlab alias for nodesktop mode
alias matlab='matlab -nodesktop'

# BFG Repo Cleaner alias
alias bfg='java -jar $HOME/bfg/bfg.jar'

# Fix TERM issues over SSH
alias ssh='TERM=xterm-256color ssh'

# YAML visualization with jless
alias yless='jless --yaml'

# lsd aliases for directory listing
alias l='lsd --group-directories-first -lah'
alias la='lsd --group-directories-first -lAh'
alias ll='lsd --group-directories-first -lh'
alias ls='lsd --group-directories-first'
alias lsa='lsd --group-directories-first -lah'
alias lt='lsd --group-directories-first -lAhrt'

# Navigation aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -- -='cd -'

# Universal file decompressor function
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
