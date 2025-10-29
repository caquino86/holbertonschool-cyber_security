#!/bin/bash
whois "$1" | awk -F':' '/Registrant|Admin|Tech/ && /Name|Organization|Street|City|State|Postal Code|Country|Phone|Fax|Email/ {gsub(/^[ \t]+|[ \t]+$/, "", $2); sub(/:$/, "", $1); print $1 "," $2}' > "$1.csv"
