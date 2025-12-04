#!/bin/bash
[ "$EUID" -ne 0 ] && { echo "Run as root"; exit 1; } ; nmap -sn -PU53,161,162 "$1"
