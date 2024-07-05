#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Log file and secure passwords file
LOGFILE="/var/log/user_management.log"
PASSWORD_DIR="/var/secure"
PASSWORD_FILE="$PASSWORD_DIR/user_passwords.txt"

# Create log file and secure password directory and file with appropriate permissions
touch $LOGFILE
chmod 600 $LOGFILE  # Ensure log file is secure
mkdir -p $PASSWORD_DIR
touch $PASSWORD_FILE
chmod 600 $PASSWORD_FILE  # Ensure password file is secure

# Check if input file is provided
if [ $# -eq 0 ]; then
    echo "No arguments provided. Please provide the text file containing usernames and groups."
    exit 1
fi

# Read input file line by line
while IFS=';' read -r user groups
do
    # Remove leading and trailing whitespace from user and groups
    user=$(echo "$user" | xargs)
    groups=$(echo "$groups" | xargs)

    # Check if user already exists
    if id "$user" &>/dev/null; then
        echo "User $user already exists. Skipping user creation..." | tee -a $LOGFILE
    else
        # Create personal group for user
        groupadd "$user"

        # Create user and their personal group
        useradd -m -g "$user" -s /bin/bash "$user"
        if [ $? -eq 0 ]; then
            echo "User $user created successfully." | tee -a $LOGFILE
        else
            echo "Failed to create user $user." | tee -a $LOGFILE
            continue
        fi
    fi

    # Create additional groups and add user to them
    IFS=',' read -r -a group_array <<< "$groups"
    for group in "${group_array[@]}"
    do
        # Remove leading and trailing whitespace from group
        group=$(echo "$group" | xargs)
        
        # Skip if group is empty
        if [[ -z "$group" ]]; then
            continue
        fi

        # Check for valid group name
        if ! [[ "$group" =~ ^[a-zA-Z0-9_-]+$ ]]; then
            echo "'$group' is not a valid group name" | tee -a $LOGFILE
            continue
        fi

        if ! getent group "$group" > /dev/null 2>&1; then
            groupadd "$group"
            echo "Group $group created." | tee -a $LOGFILE
        fi
        usermod -aG "$group" "$user"
        echo "User $user added to group $group." | tee -a $LOGFILE
    done

    # Generate random password
    password=$(openssl rand -base64 12)

    # Set user password
    echo "$user:$password" | chpasswd

    # Log the password securely
    echo "$user,$password" >> $PASSWORD_FILE
    echo "Password for user $user set and stored securely." | tee -a $LOGFILE

done < "$1"

echo "User creation process completed." | tee -a $LOGFILE
