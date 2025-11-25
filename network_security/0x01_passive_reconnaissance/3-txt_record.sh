#!/bin/bash
nslookup -q=txt $1 | awk '/text =/ {print $0}'
