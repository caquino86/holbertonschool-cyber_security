#!/bin/bash
nslookup -type=A "$1" | awk '/^Address: / {print $2}'
