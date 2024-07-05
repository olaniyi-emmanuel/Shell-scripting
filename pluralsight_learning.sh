#!/bin/bash 
echo "*******************************************"
read -p "Enter your user_name: " user_name 
echo "*******************************************"
read -sp "Enter your Gender: " user_gender 
echo "*******************************************"
read -sp "Enter your assword: " user_password 
echo "*******************************************"
#user_password="${2:-Password}"
echo " Your credentials are: $user_name, $user_password and $user_gender"
