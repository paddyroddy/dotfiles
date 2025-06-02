# initialise zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
    print -P "%F{red}Installing Zinit...%f"
    mkdir -p "$(dirname "$ZINIT_HOME")"
    # shellcheck disable=SC1091
    git clone https://github.com/zdharma-continuum/zinit.git \
    "$ZINIT_HOME" && source "${ZINIT_HOME}/zinit.zsh"
else
    # shellcheck disable=SC1091
    source "${ZINIT_HOME}/zinit.zsh"
fi

# plugins
zinit for \
    wait lucid light-mode \
    as"light" Aloxaf/fzf-tab \
    as"light" zdharma-continuum/fast-syntax-highlighting \
    as"light" zsh-users/zsh-autosuggestions \
    as"snippet" OMZP::git \
    as"snippet" OMZP::tmux \
    as"light" atinit"zicompinit; zicdreplay -q" zsh-users/zsh-completions
