#!/bin/bash

# Ellenőrizzük, hogy megfelelő számú paramétert adtak-e meg
if [ "$#" -ne 1 ]; then
    echo "Használat: $0 <keresett_név>"
    exit 1
fi

# Paraméterként megadott név
search_name="$1"

# Ellenőrizzük, hogy a people.csv fájl létezik-e
if [ ! -f "people.csv" ]; then
    echo "A people.csv fájl nem található!"
    exit 1
fi

# Keresés a fájlban a név alapján
age=$(awk -F';' -v name="$search_name" '$1 == name {print $2}' people.csv)

# Ellenőrizzük, hogy találtunk-e egyezést
if [ -z "$age" ]; then
    echo "Nincs találat a(z) '$search_name' névre!"
else
    echo "$search_name életkora: $age"
fi