#Script creates user in different Linux distribution 


UBUNTU='cat /etc/os-release  | grep -io ubuntu | head -n 1' 
#RHEL = UBUNTU = 'cat /etc/os-release  | grep -io ubuntu | head -n 1' 

#!/bin/bash

# Function to create a user
create_user() {
    local username="$1"

    gecho "Creatin user: $username"

    # Add commands here to create the user for the specific distribution
   
    #for Debian/Ubuntu
    useradd -m "$username"
    passwd "$username"

    echo "User $username created successfully."
}

# Detect Linux distribution
if [ -e "/etc/os-release" ]; then
    source "/etc/os-release"
    distribution="$ID"
else
    echo "Unable to detect the Linux distribution."
    exit 1
fi

# Use a case statement for distribution-specific actions
case "$distribution" in
    "debian" | "ubuntu" | "devuan")
        create_user "myuser"
        ;;
    "fedora" | "centos" | "rhel")
        create_user "myuser"
        ;;
    "arch" | "manjaro")
        create_user "myuser"
        ;;
    *)
        echo "Unsupported distribution: $distribution"
        exit 1
        ;;
esac

exit 0


#create user in Ubuntu only 
for u in user{1..5}; do
    sudo useradd $u 
    echo "Enter your password" | sudo passwd -stdin; 
done


for u in user{1..5}; do
    sudo userdel $u -r; 
done

