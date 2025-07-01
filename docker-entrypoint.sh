#!/bin/bash

# Set default values if environment variables are not provided
USERNAME=${USERNAME:-debian}
PASSWORD=${PASSWORD:-debian}
PACKAGES=${PACKAGES:-}

# Update and upgrade packages
apt update
apt upgrade -y

# Install additional packages if specified
if [ -n "$PACKAGES" ]; then
    echo "Installing packages: $PACKAGES"
    apt install -y $PACKAGES
fi

# Create the user with sudo privileges
useradd -mG sudo "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd
chsh -s /bin/bash "$USERNAME"

# Start SSH service
service ssh start

# Keep container running
journalctl --follow