#!/bin/bash
echo "$(nslookup "$1" | awk '/^Address: / { print $2 }')"
