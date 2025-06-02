# shellcheck disable=SC2034
# https://github.com/zdharma-continuum/zinit#manual
ZINIT_DEFAULT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f "${ZINIT_DEFAULT_HOME}/zinit.zsh" ]]; then
    print -P "%F{red}Installing Zinit...%f"
    mkdir -p "$(dirname "$ZINIT_DEFAULT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git \
    "$ZINIT_DEFAULT_HOME" && source "${ZINIT_DEFAULT_HOME}/zinit.zsh"
else
    # shellcheck disable=SC1091
    source "${ZINIT_DEFAULT_HOME}/zinit.zsh"
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
