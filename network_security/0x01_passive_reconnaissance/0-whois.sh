#!/bin/bash
whois "$1" | awk -F':' '/Registrant|Admin|Tech/ || /Street/ || /Phone Ext/ {gsub(/^ +| +$/,"",$2); printf "%s,%s%s\n",$1,$2,($1 ~ /Street/)?" ":""} /Phone Ext:/ && $2=="" {print "Phone Ext:,"}' > "$1.csv"
