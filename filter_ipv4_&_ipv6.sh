#!/bin/bash 
command_output=$(your_command_here)

# Use grep with a regular expression to filter IPv4 addresses
ipv4_addresses=$(echo "$command_output" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b") | awk 'NR==1 {print}'

# Print the filtered IPv4 addresses
echo "$ipv4_addresses"