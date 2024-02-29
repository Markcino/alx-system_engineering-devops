#!/bin/bash

# Check if URL argument is provided
if [ -z "$1" ]; then
  echo "Error: URL argument is missing"
  exit 1
fi

# Send request to the URL and store the response in a variable
response=$(curl -sI "$1")

# Extract the content length from the response headers
content_length=$(echo "$response" | grep -i "Content-Length" | awk '{print $2}' | tr -d '\r')

# Check if content length is empty
if [ -z "$content_length" ]; then
  echo "Error: Failed to get the size of the response body"
  exit 1
fi

# Display the size of the response body
echo "$content_length"
