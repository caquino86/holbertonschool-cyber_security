#!/bin/bash
whois "${1}" 2>/dev/null | awk 'BEGIN{print"Section,Field,Value"} /^(Registrant|Admin|Tech)/{s=$1;sub(/:$/,"",s);sec=s;next} NF&&sec{ gsub(/^[ \t]+|[ \t]+$|\r$/,"",$1); f=$1; $1=""; v=substr($0,2); gsub(/^[ \t]+$/,"",v); if(f~"Street")v=v" "; if(f~"Ext")f=f":"; print sec","f","v }' | tr '\n' '\r' | tr '\r' '\n' | head -c -1
