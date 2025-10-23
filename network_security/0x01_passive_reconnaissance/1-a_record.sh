#!/bin/bash
nslookup "$1" | awk '/^Address: / { print $2 }'
