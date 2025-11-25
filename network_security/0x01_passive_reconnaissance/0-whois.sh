#!/bin/bash
whois "$1" | awk -F':' '/Registrant|Admin|Tech/ && /(Name|Organization|Street|City|State|Postal Code|Country|Phone$|Fax$|Email|Phone Ext:|Fax Ext:)/ {gsub(/^[ \t]+|[ \t]+$/, "", $2); if ($1 ~ /Street$/) $2=$2" "; print $1 "," $2}' > "$1.csv"
