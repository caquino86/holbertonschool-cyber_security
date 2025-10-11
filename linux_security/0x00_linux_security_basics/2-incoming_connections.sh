#!/bin/bash
printf "Aplicando reglas de iptables...\n"; sudo iptables -P INPUT DROP; sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
