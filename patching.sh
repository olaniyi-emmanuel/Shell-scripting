#!/bin/bash

# Update package information
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Dist-upgrade for handling package dependencies
sudo apt dist-upgrade -y

# Autoremove to remove obsolete packages
sudo apt autoremove -y

# Reboot the system if required
if [ -f /var/run/reboot-required ]; then
    echo "Rebooting the system..."
    sudo reboot
else
    echo "No reboot required."
fi
