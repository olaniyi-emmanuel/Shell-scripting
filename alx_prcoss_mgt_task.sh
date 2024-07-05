#!/bin/bash

echo "My PID is" $$

# Write a Bash script that displays a list of currently running processes.
ps -auxf 

ps -auxf | grep -i bash 

while true; do
    echo "To infinity and beyond"
    sleep 2
done
