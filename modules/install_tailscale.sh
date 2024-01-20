#!/bin/bash
# INSTALL TAILSCALE

# Source the checks script
source /utils/checks.sh

# Define package and, if needed, uncomment the command name
packageName="tailscale"
# commandName="Command"

# Uncomment the appropriate check function, ensuring the comment-out the other:

# if checkPackageAndCommand "$packageName" "$commandName"; then
if checkPackageInstalled "$packageName"; then
    echo ">>> Installing Tailscale..."
    curl -fsSL https://tailscale.com/install.sh | sh
    tailscale up --ssh --accept-dns --accept-routes --authkey=$TS_AUTHKEY
    tailscale set --auto-update
fi
