#!/bin/bash

# Adjust the increment as needed
INCREMENT=2.0

# Get the current font size from a running Kitty instance
# CURRENT_SIZE=$(kitty @ get-font-size | jq .size)

if [ ! -z "$CURRENT_SIZE" ]; then
    # Calculate the new size
    NEW_SIZE=$(echo "$CURRENT_SIZE + $INCREMENT" | bc)

    # Set the new font size
    kitty @ set-font-size $NEW_SIZE
fi

kitty @ set-font-size 22
