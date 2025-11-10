#!/bin/bash

# Define the input file containing domain names (one per line)
DOMAIN_FILE="domains.txt"
# Define the output CSV file
OUTPUT_FILE="whois_output.csv"

# Function to safely format data for CSV (removes commas and excess whitespace)
format_csv_field() {
    local data="$1"
    # Remove commas and trim leading/trailing whitespace
    echo "$data" | sed -E 's/,/ /g; s/^[[:space:]]+|[[:space:]]+$//g'
}

# Add CSV header
echo "Domain,Registrant Name,Registrant Organization,Admin Name,Admin Organization,Tech Name,Tech Organization" > "$OUTPUT_FILE"

# Check if the domain file exists
if [[ ! -f "$DOMAIN_FILE" ]]; then
    echo "Error: $DOMAIN_FILE not found. Please create it with one domain per line."
    exit 1
fi

echo "Starting WHOIS lookups..."

# Read domain names from the file
while IFS= read -r domain; do
    if [[ -z "$domain" ]]; then
        continue
    fi

    echo "Querying WHOIS for: $domain"
    # Get whois data once to avoid multiple queries
    WHOIS_DATA=$(whois "$domain")

    # Extract Registrant Information
    REG_NAME=$(echo "$WHOIS_DATA" | grep -Ei 'Registrant Name|Reg Name|Name' | head -n 1 | awk -F: '{print $2}')
    REG_ORG=$(echo "$WHOIS_DATA" | grep -Ei 'Registrant Organization|Reg Organization|Organization|OrgName' | head -n 1 | awk -F: '{print $2}')

    # Extract Admin Information
    ADMIN_NAME=$(echo "$WHOIS_DATA" | grep -Ei 'Admin Name|Admin Contact|Administrative Contact|Admin' | head -n 1 | awk -F: '{print $2}')
    ADMIN_ORG=$(echo "$WHOIS_DATA" | grep -Ei 'Admin Organization|Admin Org|Administrative Organization|AdminStreet' | head -n 1 | awk -F: '{print $2}')

    # Extract Tech Information
    TECH_NAME=$(echo "$WHOIS_DATA" | grep -Ei 'Tech Name|Tech Contact|Technical Contact|Tech' | head -n 1 | awk -F: '{print $2}')
    TECH_ORG=$(echo "$WHOIS_DATA" | grep -Ei 'Tech Organization|Tech Org|Technical Organization|TechStreet' | head -n 1 | awk -F: '{print $2}')

    # Format fields for CSV
    F_REG_NAME=$(format_csv_field "$REG_NAME")
    F_REG_ORG=$(format_csv_field "$REG_ORG")
    F_ADMIN_NAME=$(format_csv_field "$ADMIN_NAME")
    F_ADMIN_ORG=$(format_csv_field "$ADMIN_ORG")
    F_TECH_NAME=$(format_csv_field "$TECH_NAME")
    F_TECH_ORG=$(format_csv_field "$TECH_ORG")

    # Append data to the CSV file
    echo "$domain,$F_REG_NAME,$F_REG_ORG,$F_ADMIN_NAME,$F_ADMIN_ORG,$F_TECH_NAME,$F_TECH_ORG" >> "$OUTPUT_FILE"

done < "$DOMAIN_FILE"

echo "Completed. Data saved to $OUTPUT_FILE"

