#!/bin/bash


#Make a function that will return a greeting statement that uses an input;
# Your program should return, "Hello, <name> how are you doing today?".

function greetings () {
    if (( "$#" != 0 )) ; then 
        name = $1
    else 
        declare name 
        read -p "Enter your name:  " name
echo "Hello, $name how are you doing today?"
fi
}

greetings 


#!/bin/bash

# Simply greet the user by given name.

function greet {
  user_name=$1
 
  [[ $user_name =~ ^[a-zA-Z]+$ ]] && echo "Hello, $user_name how are you doing today?" || \
  echo "Name should consist of letters only."

  return 0
}

greet $1

exit 0



