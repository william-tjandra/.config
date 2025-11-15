#!/bin/bash
# install-dotfiles.sh
# Deploys dotfiles from the config root using Stow.

# Exit immediately if a command fails
set -e

echo "Deploying dotfiles with Stow..."

if [[ "$OS" == "Darwin" ]]; then
    brew install stow
elif [[ "$OS" == "Linux" ]]; then
    echo "Linux setup not yet implemented. Exiting."
    exit 1
else
    echo "Unsupported OS: $OS. Exiting."
    exit 1
fi

# Navigate to the config root directory to run stow
# This is crucial because stow expects to be run from the parent
# of the 'stow packages' (e.g., zsh-boot, vim)
cd "$XDG_CONFIG_HOME"

# Stow universal packages
stow zsh-boot   # Links .zshenv
stow vim        # Links .vimrc

# Stow OS-specific packages
if [[ "$OS" == "Darwin" ]]; then
    echo "Stowing Mac-specific packages..."
    stow ssh-mac
elif [[ "$OS" == "Linux" ]]; then
    echo "Stowing Linux-specific packages..."
    # stow ssh-linux
fi

echo "Dotfile deployment complete."