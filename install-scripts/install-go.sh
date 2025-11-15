#!/bin/bash
# install-go.sh
# Installs Go

# Exit immediately if a command fails
set -e

echo "Installing Go tools..."

if [[ "$OS" == "Darwin" ]]; then
    brew install go
elif [[ "$OS" == "Linux" ]]; then
    echo "Linux setup not yet implemented. Exiting."
    exit 1
else
    echo "Unsupported OS: $OS. Exiting."
    exit 1
fi

# Set Go env vars for this script
export GOPATH="$HOME/.local/share/go"
export GOBIN="$GOPATH/bin"

# Create the new clean directories
mkdir -p "$GOPATH"
mkdir -p "$GOBIN"

# Install 'air' for live reloading
go install github.com/air-verse/air@latest

echo "Go setup complete."