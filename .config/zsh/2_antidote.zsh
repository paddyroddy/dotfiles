# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins="${ZDOTDIR:-~}/.config/zsh_plugins"

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch "${zsh_plugins}".txt

# Lazy-load antidote from its functions directory.
# shellcheck disable=SC2207
fpath=($(brew --prefix)/opt/antidote/share/antidote/functions "$fpath")
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! "${zsh_plugins}.zsh" -nt "${zsh_plugins}.txt" ]]; then
  antidote bundle <"${zsh_plugins}.txt" >|"${zsh_plugins}.zsh"
fi

# Source your static plugins file.
# shellcheck disable=SC1090
source "${zsh_plugins}.zsh"
