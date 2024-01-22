#!/bin/bash
# ## INSTALL SUDO

# Source the checks script
source ../utils/checks.sh

# Define package and, if needed, uncomment the command name
packageName="sudo"
# commandName="Command"

# Uncomment the appropriate check function, ensuring the comment-out the other:

# if checkPackageAndCommand "$packageName" "$commandName"; then
if checkPackageInstalled "$packageName"; then
    echo ">>> Installing sudo…"
    apt install -y sudo
else
    echo ">>> sudo is already installed. Skipping…"
fi