#!/bin/zsh
#
# environment.zsh - Environment variables and locale setup
#

export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CONDA_HOME="$HOME/miniforge3"

# Source additional environment if it exists
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"
