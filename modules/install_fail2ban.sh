#!/bin/bash
# ## INSTALL FAIL2BAN

# Source the checks script
source /utils/checks.sh

# Define package and, if needed, uncomment the command name
packageName="fail2ban"
# commandName="Command"

# Uncomment the appropriate check function:

# if checkPackageAndCommand "$packageName" "$commandName"; then
if checkPackageInstalled "$packageName"; then
    echo ">>> Installing fail2ban"
    apt install -y fail2ban && cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
    cp files/debian-initd /etc/init.d/fail2ban
    update-rc.d fail2ban defaults
    service fail2ban start
else
    echo ">>> fail2ban is already installed. Skipping…"
fi