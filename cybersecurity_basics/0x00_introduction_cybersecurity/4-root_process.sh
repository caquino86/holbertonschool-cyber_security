#!/bin/bash
#ps aux --no-heading | grep -v '^root' | awk -v user="$1" '$1 == user && ($5 != 0 || $6 != 0)'
#!/bin/bash

# Check if username is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

# Monitor processes started by the specified user
ps -u "$1" -o user,pid,vsz,rss,comm --no-headers | grep -vE '^[^ ]+ +[0-9]+ +0 +0 '
