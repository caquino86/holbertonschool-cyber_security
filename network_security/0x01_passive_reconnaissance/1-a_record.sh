#!/bin/bash
nslookup -type=A "$1" | awk '/^Address: / {print $2}' | while read ip; do echo "$ip"; done
