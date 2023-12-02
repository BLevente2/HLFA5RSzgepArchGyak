#!/bin/bash

# Ellenőrizzük, hogy meg lett-e adva a végállomás paraméterként
if [ "$#" -eq 0 ]; then
    echo "Hibás használat! Kérem, adja meg a végállomást paraméterként!"
    exit 1
fi

# A végállomás a bemeneti paraméterként megadott érték
destination="$1"

# Letöltés és kicsomagolás
wget -N https://gtfsapi.mvkzrt.hu/gtfs/gtfs.zip
unzip -o gtfs.zip -d gtfs_data

# Ellenőrizzük, hogy sikerült-e a letöltés és kicsomagolás
if [ $? -ne 0 ]; then
    echo "Hiba történt a GTFS adatbázis letöltése és kicsomagolása során!"
    exit 1
fi

# Kilistázzuk azokat az utakat, amelyek a megadott végállomást érintik
cat gtfs_data/routes.txt | grep -E "\b$destination\b" > selected_routes.txt

# Ellenőrizzük, hogy találtunk-e egyezést
if [ -s selected_routes.txt ]; then
    echo "Azok az utak, amelyek a $destination végállomásról indulnak, vagy oda mennek:"
    cat selected_routes.txt
else
    echo "Nincs ilyen végállomás a GTFS adatbázisban!"
fi

# Tisztítás: töröljük az előzőleg letöltött és kicsomagolt fájlokat
rm -r gtfs.zip gtfs_data selected_routes.txt