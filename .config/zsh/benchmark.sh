#!/usr/bin/env bash
echo $"zmodload zsh/zprof" > /tmp/zshrc

for conf in "$HOME/.config/zsh/"*.zsh; do
    echo -e "\n### $conf\n" >> /tmp/zshrc
    cat $conf >> /tmp/zshrc
done

echo -e "\nzprof" >> /tmp/zshrc
