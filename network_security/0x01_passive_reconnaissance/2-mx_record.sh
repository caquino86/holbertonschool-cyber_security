#!/bin/bash
nslookup -query=mx "$1" | awk '/mail exchanger/ {print $0}'
