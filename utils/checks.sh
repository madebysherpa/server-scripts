#!/bin/bash
# 
# This check has two flavors: 
# 1) "checkPackageAndCommand" ensures vital commands are properly set up in the PATH
# 2) "checkPackageInstalled" ensures common packages exist, without regard to its command
#
# To implement, add `source /utils/checks.sh` in each package install module.
# 
#
# ### CHECK PACKAGE AND COMMAND
# For apps where its command in the PATH is critical (like 1Password), 
# use the combined check with its `dpkg packageName`` and `command` like this:
# 
# | source ../utils/checks.sh
# | 
# | if checkPackageAndCommand "1password-cli" "op"; then
# |     # ... Installation commands for 1Password ...
# | fi
# 
# 
# ### CHECK PACKAGE ONLY
# For apps where the PATH isn't necessary to check (like ufw),
# use the shorter check like this:
# 
# | source ../utils/checks.sh
# | 
# | if checkPackageInstalled "ufw"; then
# |     # ... Installation commands for UFW ...
# | fi

# Check only if the package is installed
checkPackageInstalled() {
    local packageName=$1
    echo ">>> Checking if $packageName package is installed."
    if dpkg -l | grep -qw $packageName; then
        echo ">>> $packageName package is already installed. Skipping…"
        return 1
    else
        echo ">>> $packageName package is not installed."
        return 0
    fi
}

# Check if both the package is installed and the command is available
checkPackageAndCommand() {
    local packageName=$1
    local commandName=$2

    # Check package
    checkPackageInstalled $packageName
    local packageStatus=$?

    # Check command
    echo ">>> Checking if $commandName command is available."
    if command -v $commandName >/dev/null 2>&1; then
        echo ">>> $commandName command is available."
        local commandStatus=1
    else
        echo ">>> $commandName command is not available."
        local commandStatus=0
    fi

    # Determine overall status
    if [ $packageStatus -eq 1 ] && [ $commandStatus -eq 1 ]; then
    echo ">>> Both $packageName and $commandName are available. Skipping…"
    return 1
elif [ $packageStatus -eq 0 ] || [ $commandStatus -eq 0 ]; then
    echo ">>> Installing or configuring $packageName..."
    # Here, include the installation or configuration commands
    # Wrap these commands with error handling if necessary
    return 0
fi
