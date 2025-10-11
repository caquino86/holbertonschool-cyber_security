#!/bin/bash
printf ; sudo iptables -P INPUT DROP; sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
