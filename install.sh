#!/bin/bash
#
# install.sh
#
# This script automates the setup of a new developer environment
# by installing tools and deploying dotfiles with Stow.
#
# It assumes Homebrew/apt and Git are already installed, and that this
# script is being run from the ~/.config repository.

# Stops the script if any command fails
set -e

# Store OS type in a variable
export OS=$(uname -s)

echo "Starting automated setup..."

# Set XDG Base Directory variables for *this script's session*
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"

# Define the path to your installation scripts
SCRIPT_DIR="$XDG_CONFIG_HOME/install-scripts"

# Make all sub-scripts executable
chmod +x "$SCRIPT_DIR"/*.sh

"$SCRIPT_DIR/install-os-packages.sh"

"$SCRIPT_DIR/install-docker.sh"

"$SCRIPT_DIR/install-zsh.sh"

"$SCRIPT_DIR/install-node.sh"

"$SCRIPT_DIR/install-go.sh"

"$SCRIPT_DIR/stow-deployment.sh"

echo "Setup complete!"
echo "Please restart your shell (exec zsh) for all changes to take effect."