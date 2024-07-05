#!/bin/bash

#This shell script is to create a user for Ubuntu distro

#This prompt get the credentials from the user 
prompt_user () {
    message=${1:-"Input the required instruction to create your account"}
    echo "$message"
    read -p "Enter your username: " user_name 
    read -sp "Enter your password: " user_password  
    echo ""
    read -sp  "Enter your password again: " user_password_check 
}

#This fuction checks if the user exists on the server  
check_user () {
    grep -q \^$1\: /etc/passwd && return 0 
}



if [ $# -eq 0 ] ; then
    prompt_user 
    while [ "$user_password" != "$user_password_check" ] ; do
        prompt_user "Password did not match, re-enter details"
    exit 1
    done
else
    user_name=$1
    user_password=${2:-Password1}
fi

while check_user $user_name ; do 
    prompt_user "The user already  exist"
done

echo -e $'\n'"$user_name $user_password"