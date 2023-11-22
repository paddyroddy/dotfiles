# sharkdp/fd for junegunn/fzf
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
export FZF_DEFAULT_OPTS='--ansi'

# Install in .local directory
export PATH="$HOME/.local/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# ruby
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
