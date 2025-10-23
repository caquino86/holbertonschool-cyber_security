#!/bin/bash
whois "$1" | awk -F':' '/Registrant|Admin|Tech/ || /Street/ || /Phone Ext/ {gsub(/^ +| +$/,"",$2); printf "%s,%s%s\n",$1,$2,($1 ~ /Street/)?" ":""; if($1 ~ /Phone Ext/) && $2==""{printf "Phone Ext:,\n"}}' | awk 'ORS=NR==1?"":"\n"'

