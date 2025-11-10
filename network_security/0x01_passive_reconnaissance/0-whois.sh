#!/bin/bash
whois "$1" | awk '/Registrant|Admin|Tech/,/^$/ {gsub(/^Street:[[:space:]]*/, "Street,"); gsub(/^Phone Ext:[[:space:]]*/, "Phone Ext:,"); if ($0 ~ /^[A-Za-z ]+:/) {split($0,a,":"); v=substr($0,index($0,":")+1); gsub(/^[[:space:]]+/, "", v); printf "%s,%s", a[1], v; if ($0 ~ /^Street:/) printf " "; print ""}}' | sed '$!s/$/\n/'
