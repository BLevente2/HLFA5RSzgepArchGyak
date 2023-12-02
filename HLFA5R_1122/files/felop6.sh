#!/bin/bash

# Ellenőrizzük, hogy meg lett-e adva a fájlnév paraméterként
if [ "$#" -eq 0 ]; then
    echo "Hibás használat! Kérem, adja meg a fájl nevét paraméterként!"
    exit 1
fi

# Első paraméterként megadott fájlnév
filename="$1"

# Ellenőrizzük, hogy a fájl létezik és olvasható-e
if [ ! -f "$filename" ] || [ ! -r "$filename" ]; then
    echo "A megadott fájl nem létezik vagy nem olvasható!"
    exit 1
fi

# Bekérjük a felhasználótól a keresett nevet
read -p "Kérem, adja meg a keresett nevet: " search_name

# Keresés a fájlban és kiírás az eredményről
result=$(grep "^$search_name:" "$filename")

# Ellenőrizzük, hogy talált-e egyezést
if [ -n "$result" ]; then
    echo "A keresett névhez tartozó id: $result"
else
    echo "Nincs találat a megadott névre!"
fi