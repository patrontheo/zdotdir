#!/bin/zsh
#
# conda.zsh - Conda/Mamba initialization
#

# --- Conda / Mamba setup ---
# Only initialize if CONDA_HOME is defined (in environment.zsh)
if [[ -n "$CONDA_HOME" ]]; then
    # Source Conda
    if [[ -f "$CONDA_HOME/etc/profile.d/conda.sh" ]]; then
        . "$CONDA_HOME/etc/profile.d/conda.sh"
    fi

    # Source Mamba if it exists
    if [[ -f "$CONDA_HOME/etc/profile.d/mamba.sh" ]]; then
        . "$CONDA_HOME/etc/profile.d/mamba.sh"
    fi
fi
# ---------------------------