#!/bin/bash
grep -q "Registrant" < <(whois "$1")
