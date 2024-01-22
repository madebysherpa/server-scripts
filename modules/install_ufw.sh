#!/bin/bash
# ## INSTALL UFW

# Source the checks script
source ../utils/checks.sh

# Define package and, if needed, uncomment the command name
packageName="ufw"
# commandName="Command"

# Uncomment the appropriate check function, ensuring the comment-out the other:

# if checkPackageAndCommand "$packageName" "$commandName"; then
if checkPackageInstalled "$packageName"; then
    echo ">>> Installing ufw…"
    apt install -y ufw
    ufw default deny incoming
    ufw default allow outgoing
    ufw allow ssh
    ufw allow http
    ufw allow https
    ufw allow 1991/tcp
    ufw enable
    ufw reload
else
    echo ">>> ufw is already installed. Skipping…"
fi