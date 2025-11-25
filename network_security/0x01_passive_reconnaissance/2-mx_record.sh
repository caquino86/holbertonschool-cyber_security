#!/bin/bash
nslookup -q=mx $1 | awk '/mail exchanger/ {print $0}'
