#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  $HOME/.local/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

# Environment variables and locale setup
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Conda home if conda is installed
export CONDA_HOME="$HOME/miniforge3"

# Homebrew environment
(( $+commands[brew] )) && eval $(brew shellenv)

# Source additional environment if it exists
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"
