#!/usr/bin/env bash
# Create a temporary zshrc file
TEMP_ZSHRC="/tmp/zshrc"
# shellcheck disable=SC2188
> "$TEMP_ZSHRC"

# Concatenate all .zsh files from ~/.config/zsh/
for conf in "$HOME/.config/zsh/"*.zsh; do
    if [ -f "$conf" ]; then
        {
            echo -e "### $conf\n"
            cat "$conf"
            echo
        } >> "$TEMP_ZSHRC"
    fi
done
