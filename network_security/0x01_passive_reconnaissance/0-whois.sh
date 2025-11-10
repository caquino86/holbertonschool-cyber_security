#!/bin/bash
whois "$1" | awk '/Registrant|Admin|Tech/,/^$/ {f=$0; sub(/^[^:]+:/,""); gsub(/^[[:space:]]+/, "", f); if ($0 ~ /^Street:/) f=f" "; sub(/^([^:]+):/, "\\1,"); print f}' | sed '$!s/$/\n/'
