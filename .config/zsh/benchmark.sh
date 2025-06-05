#!/usr/bin/env bash
# Create a temporary zshrc file
TEMP_ZSHRC="/tmp/zshrc"

# Required for starting profiling
echo "zmodload zsh/zprof" > "$TEMP_ZSHRC"

# Concatenate all .zsh files from ~/.config/zsh/
for conf in "$HOME/.config/zsh/"*.zsh; do
    if [ -f "$conf" ]; then
        echo -e "\n### $conf\n" >> "$TEMP_ZSHRC"
        cat "$conf" >> "$TEMP_ZSHRC"
    fi
done

# Required for finishing profiling
echo -e "\nzprof" >> "$TEMP_ZSHRC"

# Run zsh with the temporary zshrc for profiling
echo "Running zsh with zprof and temporary configuration..."
zsh -l -i "$TEMP_ZSHRC"
