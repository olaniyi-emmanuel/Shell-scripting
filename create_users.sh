#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Log file and secure passwords file
LOGFILE="/var/log/user_management.log"
PASSWORD_FILE="/var/secure/user_passwords.txt"

# Create log file and secure password file with appropriate permissions
touch $LOGFILE
chmod 644 $LOGFILE
touch $PASSWORD_FILE
chmod 600 $PASSWORD_FILE

# Check if input file is provided
if [ $# -eq 0 ]; then
    echo "No arguments provided. Please provide the text file containing usernames and groups."
    exit 1
fi

# Read input file line by line
while IFS=';' read -r user groups
do
    # Remove whitespace
    user=$(echo "$user" | xargs)
    groups=$(echo "$groups" | xargs)

    # Check if user already exists
    if id "$user" &>/dev/null; then
        echo "User $user already exists. Skipping..." | tee -a $LOGFILE
        continue
    fi

    # Create user and their personal group
    useradd -m -g "$user" -s /bin/bash "$user"
    if [ $? -eq 0 ]; then
        echo "User $user created successfully." | tee -a $LOGFILE
    else
        echo "Failed to create user $user." | tee -a $LOGFILE
        continue
    fi

    # Create additional groups and add user to them
    IFS=',' read -r -a group_array <<< "$groups"
    for group in "${group_array[@]}"
    do
        group=$(echo "$group" | xargs) # Remove whitespace
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
