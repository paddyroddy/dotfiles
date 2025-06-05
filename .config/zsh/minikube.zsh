# Lazy load kubectl completion
kubectl() {
    if ! command -v kubectl >/dev/null 2>&1; then
        echo "kubectl not found" >&2
        return 1
    fi
    unfunction kubectl
    # shellcheck disable=SC1090
    source <(kubectl completion zsh)
    kubectl "$@"
}
