#!/bin/bash
sudo nmap -sn "$1"  # Scan subnet passed as argument to discover live hosts
