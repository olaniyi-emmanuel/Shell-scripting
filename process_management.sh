#!/bin/bash

# To start a process with a specific proioty level
$ nice -n [value] [process name]

# To change the prority of an already running process
renice [value] -p 'PID'