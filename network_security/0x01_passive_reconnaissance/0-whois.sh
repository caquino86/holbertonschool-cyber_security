#!/bin/bash
whois "$1" | awk '/Registrant|Admin|Tech/,/^$/ {if ($0 ~ /^[A-Za-z \/]+:/) {f=$0; sub(/^([^:]+):/, "\\1,"); gsub(/^[[:space:]]+/, "", f); if ($0 ~ /^Street:/) f=f" "; print f}}' | sed '$!s/$/\n/'
