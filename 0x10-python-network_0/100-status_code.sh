#!/bin/bash

# Check if URL argument is provided
if [ -z "$1" ]; then
  echo "Error: URL argument is missing."
  exit 1
fi

# Send request and store the status code
status_code=$(curl -s -o /dev/null -w "%{http_code}" "$1")

# Display the status code
echo "$status_code"
