#!/bin/bash
[ "$EUID" -ne 0 ] && { echo "Run as root"; exit 1; } ; nmap -sn -PA22,80,443 "$1"
