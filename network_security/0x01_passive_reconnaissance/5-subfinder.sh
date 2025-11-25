#!/bin/bash
subfinder -silent -d "$1" | while read h; do ip=$(dig +short "$h" | head -n1); echo "$h,$ip"; done > "$1.txt"

