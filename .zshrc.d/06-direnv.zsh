#!/bin/zsh
#
# direnv.zsh - direnv integration
#

if (( $+commands[direnv] )); then
    eval "$(direnv hook zsh)"
fi
