#!/bin/bash
# install-node.sh
# Installs NVM, Node.js (LTS), and the Angular CLI.

# Exit immediately if a command fails
set -e

echo "Installing Node.js (LTS) via NVM and Angular CLI..."

if [[ "$OS" == "Darwin" ]]; then
    brew install nvm
elif [[ "$OS" == "Linux" ]]; then
    echo "Linux setup not yet implemented. Exiting."
    exit 1
else
    echo "Unsupported OS: $OS. Exiting."
    exit 1
fi

# Clean up old default paths
rm -rf ~/.nvm
rm -rf ~/.npm

# Set env vars for this script, using the XDG var
export NVM_DIR="$XDG_CONFIG_HOME/nvm"

# Create the new clean directories
mkdir -p "$NVM_DIR"
mkdir -p "$XDG_CONFIG_HOME/npm" # For global configs
mkdir -p "$XDG_CACHE_HOME/npm"  # For npm's cache

# Source the NVM script *within this script* to make 'nvm' command available
# This needs to be OS-aware
if [[ "$OS" == "Darwin" ]]; then
    . "$(brew --prefix)/opt/nvm/nvm.sh"
elif [[ "$OS" == "Linux" ]]; then
    # Add logic here if Linux sources nvm differently
    echo "NVM sourcing for Linux not yet implemented."
    # Example: . "/usr/share/nvm/nvm.sh"
    exit 1
else
    echo "Cannot source NVM script for unknown OS: $OS"
    exit 1
fi


# Install the latest Long-Term Support (LTS) version of Node
nvm install --lts

# Set the LTS version as the default
nvm alias default 'lts/*'

# Install the Angular CLI globally
npm install -g @angular/cli

echo "Node.js setup complete."