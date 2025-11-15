#!/bin/bash
# install-go.sh
# Installs Go

# Exit immediately if a command fails
set -e

echo "Configuring and initializing Conda for Python..."

if [[ "$OS" == "Darwin" ]]; then
    brew install --cask miniconda
elif [[ "$OS" == "Linux" ]]; then
    echo "Linux setup not yet implemented. Exiting."
    exit 1
else
    echo "Unsupported OS: $OS. Exiting."
    exit 1
fi

# Set env var for this script
export CONDARC="$HOME/.config/conda/condarc"

# Create the data directories (as defined in .condarc)
mkdir -p "$HOME/.local/share/conda/envs"
mkdir -p "$HOME/.local/share/conda/pkgs"

# Run the one-time init
# This will automatically detect ZDOTDIR and modify
# your ~/.config/zsh/.zshrc file.
conda init zsh

echo "Installing JupyterLab..."

# Set env vars for this script
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_DATA_DIR="$XDG_DATA_HOME/jupyter"

# Create the new clean directories
mkdir -p "$JUPYTER_CONFIG_DIR"
mkdir -p "$JUPYTER_DATA_DIR"

# Install JupyterLab into the base conda environment
conda install -y jupyterlab

# Generate the default config file so we can track it
jupyter lab --generate-config

echo "Python/Conda setup complete."