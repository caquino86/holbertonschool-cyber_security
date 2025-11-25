#!/bin/bash
whois "$1" | awk '/^Registrant /{s="Registrant"} /^Admin /{s="Admin"} /^Tech /{s="Tech"} /^[RT]/{split($0,a,": ");f=a[1];v=a[2];if(f~/Street/)v=v" ";if(f~/Ext$/)f=f":";if(s!="")printf("%s %s,%s\n",s,substr(f,index(f," ")+1),v)}' | sed '$!s/$/\n/'
