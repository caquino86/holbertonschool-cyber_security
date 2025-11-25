#!/usr/bin/env bash
[ -z "$1" ] && { echo "Uso: $0 <dominio>" >&2; exit 1; } || { DOMAIN="$1"; OUTPUT_FILE="${DOMAIN}.csv"; }
whois "$DOMAIN" | awk 'BEGIN{FS=":";OFS=",";T="^(Registrant|Admin|Tech) (Name|Organization|Street|City|State\\/Province|Postal Code|Country|Phone|Email|Fax|Phone Ext|Fax Ext)$";E="(Phone Ext|Fax Ext)$";S=" Street$"} {gsub(/^[[:space:]]+|[[:space:]]+$/, "", $1);if(match($1,T)){F=$1;V="";for(i=2;i<=NF;i++){V=(i==2?"":V":") $i}gsub(/^[[:space:]]+|[[:space:]]+$/, "", V);if(F~E){F=F":"};if(F~S){V=V" "};print F,V}}' > "$OUTPUT_FILE"
exit 0
