if command -v kubectl >/dev/null 2>&1; then
    # shellcheck disable=SC1090
    source <(kubectl completion zsh) &
fi
