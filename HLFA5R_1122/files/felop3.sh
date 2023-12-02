#!/bin/bash

# Letöltjük a GTFS adatbázist
wget -N https://gtfsapi.mvkzrt.hu/gtfs/gtfs.zip

# Ellenőrizzük, hogy sikeres volt-e a letöltés
if [ $? -ne 0 ]; then
    echo "Hiba történt a GTFS adatbázis letöltésekor!"
    exit 1
fi

# Kitömörítjük a letöltött állományt egy ideiglenes mappába
temp_dir="gtfs_temp"
unzip -o gtfs.zip -d "$temp_dir"

# Ellenőrizzük, hogy sikeres volt-e a kitömörítés
if [ $? -ne 0 ]; then
    echo "Hiba történt a GTFS adatbázis kitömörítésekor!"
    exit 1
fi

# Kilistázzuk azokat az utakat, amelyek a Centrumból indulnak vagy a Centrumba mennek
echo "Utak a Centrumból indulnak:"
cat "$temp_dir"/routes.txt | grep "Centrum" | cut -d',' -f2

echo "Utak, amelyek a Centrumba mennek:"
cat "$temp_dir"/routes.txt | grep "Centrum" | cut -d',' -f3

# Töröljük az ideiglenes mappát
rm -r "$temp_dir"

# Töröljük a letöltött fájlt
rm gtfs.zip