WHOIS=$(whois "$1")
echo "$WHOIS" | grep -q "Registrant" && echo "FOUND" || echo "NOT FOUND"
