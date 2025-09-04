#!/bin/zsh
#
# fzf.zsh - FZF integration
#

# Set up fzf key bindings and fuzzy completion
if (( $+commands[fzf] )); then
    source <(fzf --zsh)
fi
