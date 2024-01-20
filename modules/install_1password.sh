#!/bin/bash
# ## INSTALL 1PASSWORD-CLI

# Source the checks script
source /utils/checks.sh

# Define package and command names
packageName="1password-cli"
commandName="op"

# Uncomment the appropriate check function:

# if checkPackageAndCommand "$packageName" "$commandName"; then
# if checkPackageInstalled "$packageName"; then
    echo ">>> Installing the 1Password CLI…"
    # The following commands are now run with sudo automatically
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | \
    tee /etc/apt/sources.list.d/1password.list
    mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
    tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    apt install 1password-cli -y
else
    echo ">>> 1Password CLI is already installed. Skipping..."
fi

echo "1Password installation completed."

# Sign in to 1Password
echo ">>> Signing in to 1Password..."
eval $(op signin)