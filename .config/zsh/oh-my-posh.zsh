oh-my-posh() {
    unfunction oh-my-posh
    eval "$(oh-my-posh init zsh)"
    oh-my-posh "$@"
}
