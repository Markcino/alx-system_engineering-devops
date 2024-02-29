#!/bin/bash

# Check if URL argument is provided
if [ -z "$1" ]; then
  echo "Error: URL argument is missing"
  exit 1
fi

# Send GET request with header using curl
curl -s -H "X-School-User-Id: 98" "$1"
