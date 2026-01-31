# Lazy load direnv
if command -v direnv >/dev/null 2>&1; then
    # Initialize direnv hook on first prompt and directory change
    _direnv_hook() {
        eval "$(direnv export zsh 2>/dev/null)"
    }

    typeset -ag precmd_functions
    typeset -ag chpwd_functions

    if [[ -z "${precmd_functions[(r)_direnv_hook]+1}" ]]; then
        precmd_functions+=(_direnv_hook)
    fi

    if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
        chpwd_functions+=(_direnv_hook)
    fi
fi

## To auto switch Python environment:
# test -d .venv || uv sync
# source .venv/bin/activate
