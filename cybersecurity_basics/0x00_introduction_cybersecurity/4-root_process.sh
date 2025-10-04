#!/bin/bash
ps -u "$1" -o user,pid,vsz,rss,comm --no-headers | grep -vE '^[^ ]+ +[0-9]+ +0 +0 '
