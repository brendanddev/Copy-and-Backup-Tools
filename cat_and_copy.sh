#!/bin/bash

# Brendan Dileo, 2025-01-20

# Checks if envrioment variable is set
if [ -z "$CATFILE" ]; then
	echo "Error: The environment variable CATFILE must be set to a destination file name!"
		exit 1
fi

# Checks if at least 3 args are provided
if [ $# -lt 4 ]; then
	echo "Error: Please provide at least 4 arguments: 3 destination files and source files to concatenate."
    exit 1
fi 

# Create a temporary file to store the concatenated contents
temp=$(mktemp)

# Concatenate all the files passed as arguments and store the result in the temporary file
cat "$@" > "$temp"

# Move the concatenated content to the file specified by the 'CATFILE' environment variable
mv "$temp" "$CATFILE"

# Display a success message
echo "The files were successfully concatenated and saved to $CATFILE!"

# Make three copies of the concatenated file to the specified destinations
cp "$CATFILE" "$2"
cp "$CATFILE" "$3"
cp "$CATFILE" "$4"

# Display a message indicating that the copies were made
echo "Three copies of the concatenated file were successfully made to $2, $3, and $4!"