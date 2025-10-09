#!/bin/bash
sudo iptables -P INPUT DROP; sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
