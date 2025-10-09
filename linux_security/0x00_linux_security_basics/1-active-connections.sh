#!/bin/bash
[[ $EUID -ne 0 ]] && echo "Run as root!" && exit 1; ss -atnp
