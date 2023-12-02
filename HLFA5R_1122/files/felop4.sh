#!/bin/bash

# Bekérjük a felhasználó születési dátumát
read -p "Kérem, adja meg a születési dátumát (yyyy-mm-dd formátumban): " birthdate

# Ellenőrizzük a dátum formátumát
if ! [[ "$birthdate" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "Hibás dátumformátum! Kérem, adjon meg érvényes dátumot (yyyy-mm-dd)!"
    exit 1
fi

# Ellenőrizzük, hogy a dátum létezik-e
if ! date -d "$birthdate" &>/dev/null; then
    echo "Hibás dátum! Kérem, adjon meg érvényes dátumot (yyyy-mm-dd)!"
    exit 1
fi

# Kiszámoljuk az életkort
current_date=$(date +"%Y%m%d")
birthdate_formatted=$(date -d "$birthdate" +"%Y%m%d")
age=$(( (current_date - birthdate_formatted) / 10000 ))

# Kiírjuk az életkort
echo "Az életkor: $age év"