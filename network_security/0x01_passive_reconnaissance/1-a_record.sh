#!/bin/bash
for ip in $(nslookup -type=A "$1" | awk '/^Address: / {print $2}'); do echo "$ip"; done
