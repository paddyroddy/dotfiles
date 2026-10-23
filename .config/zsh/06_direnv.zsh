# Initialise direnv if available
if command -v direnv >/dev/null 2>&1; then
    # Hook function that runs direnv
    _direnv_hook() {
        eval "$(direnv export zsh 2>/dev/null)"
    }

    # Only add to chpwd_functions, NOT precmd_functions
    typeset -ag chpwd_functions
    if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
        chpwd_functions+=(_direnv_hook)
    fi

    # Run once on shell startup for current directory
    eval "$(direnv export zsh 2>/dev/null)"
fi

## To auto switch Python environment:
# test -d .venv || uv sync
# source .venv/bin/activate
