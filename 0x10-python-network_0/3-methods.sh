#!/bin/bash

# Check if URL is provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

# Extract the URL from the argument
url=$1

# Send an OPTIONS request to the server and retrieve the allowed methods
methods=$(curl -s -I -X OPTIONS "$url" | grep "Allow:" | cut -d' ' -f2-)

# Display the allowed methods
echo "$methods"
