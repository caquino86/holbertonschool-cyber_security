#!/bin/bash
echo "$(nslookup "$1" | grep '^Address:' | cut -d' ' -f2)"
