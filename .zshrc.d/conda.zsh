#!/bin/zsh
#
# conda.zsh - Conda and Mamba integration
#

if [[ -r "$CONDA_HOME/etc/profile.d/conda.sh" ]]; then
    source "$CONDA_HOME/etc/profile.d/conda.sh"
fi

if [[ -x "$CONDA_HOME/bin/mamba" ]]; then
    export MAMBA_EXE="$CONDA_HOME/bin/mamba"
    export MAMBA_ROOT_PREFIX="$CONDA_HOME"

    if _mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"; then
        eval "$_mamba_setup"
    fi
    unset _mamba_setup
fi
