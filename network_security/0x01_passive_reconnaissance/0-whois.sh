#!/bin/bash
whois "$1" | awk -F':' '/Registrant|Admin|Tech/ && /Name|Organization|Street|City|State|Postal Code|Country|Phone|Fax|Email/ {gsub(/^[ \t]+|[ \t]+$/, "", $2); sub(/:$/, "", $1); if ($1 ~ /Street$/) $2=$2" "; print $1 "," $2} /Registrant|Admin|Tech/ && /Phone Ext|Fax Ext/ {print $1 ":,"}'
