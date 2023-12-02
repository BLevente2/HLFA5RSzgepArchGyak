#!/bin/bash

# Ellenőrizzük, hogy a fájl létezik-e
if [ ! -f "nev_id_parok.txt" ]; then
    echo "A nev_id_parok.txt fájl nem található!"
    exit 1
fi

# Bekérjük a nevet
read -p "Kérem, adja meg a nevet: " input_name

# Ellenőrizzük, hogy a név szerepel-e a fájlban, majd kiírjuk az id-t vagy hibát adunk
id=$(awk -F';' -v name="$input_name" '$2 == name {print $1}' nev_id_parok.txt)

if [ -z "$id" ]; then
    echo "Hiba: A név nem található a fájlban!"
else
    echo "Az id a(z) '$input_name' névhez: $id"
fi