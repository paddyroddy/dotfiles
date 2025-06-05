# Lazy load mise activation
mise() {
    unfunction mise
    eval "$(mise activate zsh)"
    mise "$@"
}
