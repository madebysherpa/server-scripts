#!/bin/bash
# ## INSTALL ZSH & OhMyZSH

# Source the checks script
source /utils/checks.sh

# Define package and, if needed, uncomment the command name
packageName="zsh"
# commandName="Command"

# Uncomment the appropriate check function:

# if checkPackageAndCommand "$packageName" "$commandName"; then
if checkPackageInstalled "$packageName"; then
    echo ">>> Installing zsh…"
    apt install -y zsh && chsh -s $(which zsh) $(whoami)
else
    echo ">>> zsh is already installed. Skipping…"
fi