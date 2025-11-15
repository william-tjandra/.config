#!/bin/bash
# install-os-packages.sh
# Installs OS-specific packages (Homebrew, Apt, etc.)

# Exit immediately if a command fails
set -e

if [[ "$OS" == "Darwin" ]]; then
    echo "Running macOS (Darwin) setup..."
    
    echo "Installing Homebrew casks..."
    brew install --cask wezterm font-meslo-lg-nerd-font
    echo "Homebrew casks installed."
elif [[ "$OS" == "Linux" ]]; then
    echo "Linux setup not yet implemented. Exiting."
    # TODO: Add Linux-specific 'apt install' logic here
    # sudo apt install wezterm stow fonts-meslo-lg-nf ...
    exit 1
else
    echo "Unsupported OS: $OS. Exiting."
    exit 1
fi