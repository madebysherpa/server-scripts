#!/bin/bash
# ## INSTALL FAIL2BAN

# Source the checks script
source /utils/checks.sh

# Define package and, if needed, uncomment the command name
packageName="PackageName"
# commandName="Command"

# Uncomment the appropriate check function, ensuring the comment-out the other:

# if checkPackageAndCommand "$packageName" "$commandName"; then
if checkPackageInstalled "$packageName"; then
    # ... Insert the installation commands for package ...
fi