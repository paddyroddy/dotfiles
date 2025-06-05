#!/usr/bin/env bash
# Create a temporary zshrc file
TEMP_ZSHRC="/tmp/zshrc"
> "$TEMP_ZSHRC"

# Concatenate all .zsh files from ~/.config/zsh/
for conf in "$HOME/.config/zsh/"*.zsh; do
    if [ -f "$conf" ]; then
        echo -e "### $conf\n" >> "$TEMP_ZSHRC"
        cat "$conf" >> "$TEMP_ZSHRC"
        echo >> "$TEMP_ZSHRC"
    fi
done
