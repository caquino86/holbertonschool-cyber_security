#!/bin/bash
nslookup "$1" || { echo "Usage: $0 <domain>"; exit 1; }
