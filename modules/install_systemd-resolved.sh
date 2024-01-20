#!/bin/bash
# ## INSTALL SYSTEMD-RESOLVED

# Check if systemd-resolved is installed and active
if systemctl is-active --quiet systemd-resolved; then
    echo "systemd-resolved is already installed and active."
else
    echo "Installing and enabling systemd-resolved..."
    sudo apt-get update
    sudo apt-get install -y systemd-resolved
    sudo systemctl enable systemd-resolved
    sudo systemctl start systemd-resolved
    echo "systemd-resolved is now installed and active."
fi
