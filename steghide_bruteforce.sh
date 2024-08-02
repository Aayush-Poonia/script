#!/bin/bash

# Path to your image file
FILE="/home/kali/Pictures/mem.jpg"

# Path to your wordlist
WORDLIST="/usr/share/wordlists/rockyou.txt"

# Loop through each password in the wordlist
while read -r PASSWORD; do
    echo "Trying passphrase: $PASSWORD"
    # Attempt to extract data using steghide
    steghide extract -sf "$FILE" -p "$PASSWORD" -q
    if [ $? -eq 0 ]; then
        echo "Success! Passphrase: $PASSWORD"
        break
    fi
done < "$WORDLIST"
