#!/bin/bash

FILENAME="lstatus.log"
MODE=$1

# Clear file contents
echo '' > ~/.conky/snoopy/Scripts/$FILENAME

# Check to see if agressive checks should be made
if [[ $MODE == "agro" ]]; then
    echo "Agressive mode enabled"
fi

# Perform regular checks
if [[ `ping -W 2 -c 1 8.8.8.8 2>&1 | grep -o "1 received"` != "" ]]; then
    echo "PING" >> ~/.conky/snoopy/Scripts/$FILENAME
fi
if [[ `nslookup google.com -timeout=2 2>&1 | grep -o "Name" 2>&1` != "" ]]; then
    echo "DNS" >> ~/.conky/snoopy/Scripts/$FILENAME
fi
if [[ `cat /sys/class/net/enp0s25/carrier` == "1" ]]; then
    echo "ETHERNET" >> ~/.conky/snoopy/Scripts/$FILENAME
fi
if [[ `cat /sys/class/net/wlo1/carrier 2>&1` == "1" ]]; then
    echo "WIFI" >> ~/.conky/snoopy/Scripts/$FILENAME
fi 
