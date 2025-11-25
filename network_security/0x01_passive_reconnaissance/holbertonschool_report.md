#!/bin/bash
for ip in $(subfinder -silent -d "$1" | xargs -I{} dig +short {} | grep -Eo '([0-9]+\.){3}[0-9]+'); do shodan host "$ip"; done
