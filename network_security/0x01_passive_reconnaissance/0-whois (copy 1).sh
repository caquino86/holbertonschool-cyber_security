#!/bin/bash
whois "$1" | awk 'BEGIN{FS=": ";OFS=","} /^Registrant |^Admin |^Tech /{sub(/ .*/,"",$1);s=$1} $1 ~ /Name$|Organization$|Street$|City$|State\/Province$|Postal Code$|Country$|Phone$|Phone Ext$|Fax$|Fax Ext$|Email$/ {f=$1;v=$2;gsub(/^ +| +$/,"",v); if(f~/Street/) v=v" "; if(f~/Ext$/) f=f":"; print s" "f,v}' > "$1.csv"
