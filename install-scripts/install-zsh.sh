#!/bin/bash
# install-zsh.sh
# Installs Oh My Zsh and related plugins.

# Exit immediately if a command fails
set -e

echo "Installing Oh My Zsh..."

if [[ "$OS" == "Darwin" ]]; then
    brew install fzf
elif [[ "$OS" == "Linux" ]]; then
    echo "Linux setup not yet implemented. Exiting."
    exit 1
else
    echo "Unsupported OS: $OS. Exiting."
    exit 1
fi

if [ ! -d "$XDG_CONFIG_HOME/oh-my-zsh" ]; then
    # We must set $ZSH manually *before* running the installer
    export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "Installing Zsh plugins and theme..."
# Set the $ZSH_CUSTOM var for plugins
ZSH_CUSTOM="$XDG_CONFIG_HOME/oh-my-zsh/custom"

# Powerlevel10k
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# Zsh Autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Zsh Syntax Highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

echo "Zsh setup complete."