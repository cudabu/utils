#!/bin/bash

# Set the suffix to append before the file extension
suffix=" (Shell)"

for file in *; do
    if [ -f "$file" ]; then
        extension="${file##*.}"
        if [[ "$file" != *"$#!/bin/bash

# Set the suffix to append before the file extension
suffix="(Shell)"

# Loop through all files in the current directory
for file in *; do
    # Check if the item is a file
    if [ -f "$file" ]; then
        # Extract the file extension, if any
        extension="${file##*.}"
        # Check if the file has an extension and doesn't already include the suffix
        if [[ "$file" != *"$suffix"* && "$file" != "$extension" ]]; then
            # If there is an extension, insert the suffix before it
            if [ "$file" != "$extension" ]; then
                newname="${file%.*}${suffix}.${extension}"
            else
                # If there is no extension, just append the suffix
                newname="${file}${suffix}"
            fi
            # Rename the file
            mv "$file" "$newname"
        fi
    fi
done
suffix"* && "$file" != "$extension" ]]; then
            if [ "$file" != "$extension" ]; then
                newname="${file%.*}${suffix}.${extension}"
            else
                newname="${file}${suffix}"
            fi
            mv "$file" "$newname"
        fi
    fi
done

