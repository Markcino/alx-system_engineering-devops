#!/bin/bash

# Check if the number of arguments is correct
if [ $# -ne 2 ]; then
    echo "Usage: $0 <URL> <JSON_FILE>"
    exit 1
fi

# Assign the arguments to variables
URL=$1
JSON_FILE=$2

# Check if the JSON file exists
if [ ! -f "$JSON_FILE" ]; then
    echo "Error: JSON file '$JSON_FILE' not found"
    exit 1
fi

# Check if the JSON file is valid
if ! jq . "$JSON_FILE" >/dev/null 2>&1; then
    echo "Error: Invalid JSON file '$JSON_FILE'"
    exit 1
fi

# Send the POST request and display the response body
curl -s -X POST -H "Content-Type: application/json" -d @"$JSON_FILE" "$URL"
