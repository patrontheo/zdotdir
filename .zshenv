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
  /usr/local/go/bin
  $path
)

# Environment variables and locale setup
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Homebrew environment
if (( $+commands[brew] )); then
    eval $(brew shellenv)
elif [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Source additional environment if it exists
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# Conda setup if installed
export CONDA_HOME="$HOME/miniforge3"

if [[ -n "$CONDA_HOME" ]]; then
    if [[ -f "$CONDA_HOME/etc/profile.d/conda.sh" ]]; then
        . "$CONDA_HOME/etc/profile.d/conda.sh"
    fi

    if [[ -f "$CONDA_HOME/etc/profile.d/mamba.sh" ]]; then
        . "$CONDA_HOME/etc/profile.d/mamba.sh"
    fi
fi

# NVM configuration if installed
export NVM_DIR="$HOME/.nvm"

if [[ -n "$NVM_DIR" ]]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi