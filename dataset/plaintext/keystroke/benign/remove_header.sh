#!/bin/bash

# Check if a directory argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 directory_path"
    exit 1
fi

directory_path="$1"

# Check if the directory exists
if [ ! -d "$directory_path" ]; then
    echo "Error: Directory '$directory_path' does not exist."
    exit 1
fi

# Iterate over all files in the directory
for file in "$directory_path"/*; do
    if [ -f "$file" ]; then
        # Use sed to remove the first line and save the changes back to the file
        sed -i '1d' "$file"
        echo "First line removed from: $file"
    fi
done
