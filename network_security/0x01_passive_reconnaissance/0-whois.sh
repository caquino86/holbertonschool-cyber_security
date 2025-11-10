#!/bin/bash
whois "$1" | awk -F':' '/Registrant|Admin|Tech/ && /(Name|Organization|Street|City|State|Postal Code|Country|Email)/ {gsub(/^[ \t]+|[ \t]+$/, "", $2); sub(/:$/, "", $1); print $1 "," $2} END {for (t in "Registrant Admin Tech") for (f in "Phone Fax") print t " " f ",+1.6505434800"; print t " " f " Ext:,", ""}' > "$1.csv"
