#!/bin/bash

# Check if users `oldsoul` and `oldsoul-io` exist, then add users

if id "oldsoul" &>/dev/null; then
    echo ">>> User oldsoul already exists. Skipping user creation."
else
    echo "Creating user oldsoul…"
    adduser oldsoul --gecos "" --disabled-password
    echo "oldsoul:$USR_PASSWD" | chpasswd
    usermod -aG sudo oldsoul
    mkdir -p /home/oldsoul/.ssh
    echo "$SSH1" >> /home/oldsoul/.ssh/authorized_keys
    echo "$SSH2" >> /home/oldsoul/.ssh/authorized_keys
    chmod 700 /home/oldsoul/.ssh
    chmod 600 /home/oldsoul/.ssh/authorized_keys
    chown -R oldsoul:oldsoul /home/oldsoul/.ssh
fi

if id "oldsoul-io" &>/dev/null; then
    echo ">>> User oldsoul-io already exists. Skipping user creation."
else
    echo ">>> Creating user oldsoul-io..."
    adduser oldsoul-io --gecos "" --disabled-password
    echo "oldsoul-io:$USR_PASSWD" | chpasswd
    usermod -aG sudo oldsoul-io
    mkdir -p /home/oldsoul-io/.ssh
    echo "$SSH1" >> /home/oldsoul/.ssh/authorized_keys
    echo "$SSH2" >> /home/oldsoul/.ssh/authorized_keys
    chmod 700 /home/oldsoul-io/.ssh
    chmod 600 /home/oldsoul-io/.ssh/authorized_keys
    chown -R oldsoul-io:oldsoul-io /home/oldsoul-io/.ssh
fi
