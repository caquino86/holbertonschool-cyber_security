#!/bin/bash
nslookup -type=A "$1" | awk '/^Name:/ {name=$2} /^Address: / {echo name ": " $2}' | while read line; do echo "$line"; done
