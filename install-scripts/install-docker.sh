#!/bin/bash
# install-docker.sh
# Installs OS-specific Docker configuration (Homebrew, Apt, etc.)

# Exit immediately if a command fails
set -e

if [[ "$OS" == "Darwin" ]]; then
    echo "Installing MacOS (Darwin) Docker/Colima packages..."
    
    brew install docker colima docker-compose docker-buildx

    echo "Configuring Docker CLI plugins..."
    rm -rf ~/.docker # Remove old default path
    mkdir -p "$XDG_CONFIG_HOME/docker/cli-plugins"
    ln -sfn "$(brew --prefix)/opt/docker-compose/bin/docker-compose" "$XDG_CONFIG_HOME/docker/cli-plugins/"
    ln -sfn "$(brew --prefix)/opt/docker-buildx/bin/docker-buildx" "$XDG_CONFIG_HOME/docker/cli-plugins/"

    echo "Configuring Colima service..."
    brew services stop colima
    PLIST_FILE="$(brew --prefix)/opt/colima/homebrew.mxcl.colima.plist"
    
    if [ -d "$HOME/.colima" ] && [ ! -d "$XDG_CONFIG_HOME/colima" ]; then
        echo "Moving existing ~/.colima to $XDG_CONFIG_HOME/colima..."
        mv "$HOME/.colima" "$XDG_CONFIG_HOME/colima"
    fi

    plutil -insert EnvironmentVariables.XDG_CONFIG_HOME -string "$XDG_CONFIG_HOME" "$PLIST_FILE"
    brew services start colima
    echo "Colima service configured and started."
elif [[ "$OS" == "Linux" ]]; then
    echo "Linux setup not yet implemented. Exiting."
    # TODO: Add Linux-specific 'apt install' logic here
    # sudo apt install wezterm stow fonts-meslo-lg-nf ...
    exit 1
else
    echo "Unsupported OS: $OS. Exiting."
    exit 1
fi