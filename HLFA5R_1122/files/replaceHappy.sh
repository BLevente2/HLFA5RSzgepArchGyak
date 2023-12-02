#!/bin/bash

# Ellenőrizzük, hogy megfelelő számú paramétert adtak-e meg
if [ "$#" -ne 1 ]; then
    echo "Használat: $0 <fájlnév>"
    exit 1
fi

# Paraméterként kapott fájlnév
file="$1"

# Ellenőrizzük, hogy a fájl létezik-e
if [ ! -f "$file" ]; then
    echo "A megadott fájl nem létezik: $file"
    exit 1
fi

# Cseréljük ki a szöveget és mentsük el az új fájlba
printf "$(sed 's/happy/nem gondoltam a vizsgaidőszakra/g' "$file")" > out.txt

echo "Az átalakított szöveg el lett mentve az out.txt fájlba."