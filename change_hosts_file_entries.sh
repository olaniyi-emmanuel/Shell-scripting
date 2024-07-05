#!/bin/env bash 
#Configure an Ubuntu server aas follow 
#   - localhost resoves to the 127.0.0.2
#   - facebook.com resolves to 8.8.8.8

cp /etc/hosts ~/etc/hosts.backup 
echo "127.0.0.2             localhost" > ~/stc/hosts.new 
echo "8.8.8.8               http://www.facebook.com"

cp -f /etc/host.new /etc/hosts