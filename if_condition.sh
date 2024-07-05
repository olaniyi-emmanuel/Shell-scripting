#!/bin/bash 

declare -i days 
read -p "Enter the number of days: " days 

if (($days < 1)) ; then
    echo "Enter a numerical value" ;
    elif (($days > 30)) ; then
        echo "Value is too high" ;
        else
            echo "$days is the value provided" ; 
fi