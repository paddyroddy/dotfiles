# Initialize direnv if available
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

## To auto switch Python environment:
# test -d .venv || uv sync
# source .venv/bin/activate
