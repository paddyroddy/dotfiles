# git aliases
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias gsta='git stash push'
alias gstp='git stash pop'

# Colour aliases
alias cat='bat'
alias grep='grep --color'
alias tree='tree -C'

# Safety aliases
alias cp='cp -iv'
alias ln='ln -iv'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -iv'
alias wget='wget -c'

# Jupyter aliases
alias lab='jupyter lab'
alias notebook='jupyter notebook'

# System visualization tools
alias df='duf'
alias du='dust'
alias top='glances'

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

# lsd aliases
alias ls='eza --all --group-directories-first --header --icons'
alias la='eza --all --group-directories-first --header --icons --long'
alias lt='eza --all --group-directories-first --header --icons --reverse --sort=mod'

# Navigation aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -- -='cd -'

# Universal file decompressor
x() {
    if [ -f "$1" ]; then
        case "$1" in
        *.tar.bz2) tar xvjf "$1" ;;
        *.tar.gz)  tar xvzf "$1" ;;
        *.bz2)     bunzip2 "$1" ;;
        *.rar)     unrar x "$1" ;;
        *.gz)      gunzip "$1" ;;
        *.tar)     tar xvf "$1" ;;
        *.tbz2)    tar xvjf "$1" ;;
        *.tgz)     tar xvzf "$1" ;;
        *.zip)     unzip "$1" ;;
        *.Z)       uncompress "$1" ;;
        *.7z)      7z x "$1" ;;
        *)         echo "Unable to extract '$1'" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
