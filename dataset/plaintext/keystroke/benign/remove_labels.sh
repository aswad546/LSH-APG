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

# Iterate over all CSV files in the directory
for file in "$directory_path"/*.csv; do
    if [ -f "$file" ]; then
        # Use awk to remove the last element from each line and save the changes back to the file
        awk -F, 'BEGIN{OFS=","}{NF--; print}' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
        echo "Last element removed from each line in: $file"
    fi
done
