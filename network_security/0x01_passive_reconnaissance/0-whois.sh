#!/bin/bash
whois "$1" | awk -F':' '/Name|Organization|Street|City|State|Postal Code|Country|Phone|Fax|Email/ {gsub(/^[ \t]+|[ \t]+$/, "", $2); print $1 ":" $2}'
