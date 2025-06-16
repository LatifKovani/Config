#!/bin/bash

# Get CPU usage using standard tools
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print int(usage)}')

# Create a text-based progress bar
bar=""
filled=$(( cpu / 10 ))
for i in {0..9}; do
    if [ $i -lt $filled ]; then
        bar="${bar}█"
    else
        bar="${bar}▁"
    fi
done

# Output with icon
echo " ${cpu}% ${bar}"
