#!/bin/bash
echo "$(nslookup "$1" | awk '/^Name:/ { name=$2 } /^Address: / { print name "," $2 }')"
