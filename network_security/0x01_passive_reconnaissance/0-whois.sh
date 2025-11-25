#!/bin/bash
whois "$1" | awk '/Registrant Information/{s="Registrant"} /Admin Information/{s="Admin"} /Tech Information/{s="Tech"} /^[A-Za-z].*:/{if(s!=""){split($0,a,":");f=a[1];v=substr($0,index($0,":")+1);gsub(/^ +| +$/,"",v);if(f~/Street/)v=v" ";if(f~/Ext$/)f=f":";printf("%s %s,%s\n",s,f,v)}}' | sed '$!s/$/\n/'
