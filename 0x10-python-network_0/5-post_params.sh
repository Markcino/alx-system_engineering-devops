#!/bin/bash

# Check if URL is provided as argument
if [ -z "$1" ]; then
  echo "Error: URL is missing"
  exit 1
fi

# Set the URL
URL="$1"

# Set the POST parameters
EMAIL="test@gmail.com"
SUBJECT="I will always be here for PLD"

# Send the POST request and display the response body
curl -s -X POST -d "email=$EMAIL&subject=$SUBJECT" "$URL"
