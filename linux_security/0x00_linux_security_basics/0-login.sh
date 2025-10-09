#!/bin/bash
sudo last -F | head -n 5 | awk '{print $1, $4, $5, $6, $7}'
