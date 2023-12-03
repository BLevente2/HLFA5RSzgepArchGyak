#!/bin/bash

# Definiáljuk a letöltendő fájl URL-jét
data_url="https://gtfsapi.mvkzrt.hu/gtfs/gtfs.zip"

# Definiáljuk a letöltött fájl nevét és a kitömörítési mappát
zip_file="gtfs.zip"
extract_folder="gtfs_data"

# Definiáljuk a keresett lakóhelyet
lakohely="Egyetemváros"

# Ellenőrizzük, hogy meg lett-e adva a lakóhely paraméterként
if [ "$#" -gt 0 ]; then
    lakohely="$1"
fi

# Ellenőrizzük, hogy a letöltendő fájl már létezik-e
if [ -e "$zip_file" ]; then
    rm "$zip_file"
fi

# Ellenőrizzük, hogy a mappába már ki lett-e tömörítve az előző állomány
if [ -d "$extract_folder" ]; then
    rm -r "$extract_folder"
fi

# Letöltés
wget "$data_url"

# Ellenőrizzük, hogy sikerült-e a letöltés
if [ $? -ne 0 ]; then
    echo "Hiba történt a GTFS adatbázis letöltése során!"
    exit 1
fi

# Kitömörítés
unzip -o "$zip_file" -d "$extract_folder"

# Ellenőrizzük, hogy sikerült-e a kitömörítés
if [ $? -ne 0 ]; then
    echo "Hiba történt a GTFS adatbázis kitömörítése során!"
    exit 1
fi

# Kilistázzuk azokat az utakat, amelyek a lakóhelyből indulnak vagy oda érkeznek
grep -E "\b$lakohely\b" "$extract_folder/routes.txt" > selected_routes.txt

# Ellenőrizzük, hogy találtunk-e egyezést
if [ -s selected_routes.txt ]; then
    echo "Azok az utak, amelyek a $lakohely -ból indulnak vagy oda érkeznek:"
    cat selected_routes.txt
else
    echo "Nincs ilyen utazási útvonal a GTFS adatbázisban!"
fi

# Tisztítás: töröljük az előzőleg letöltött és kicsomagolt fájlokat
rm -r "$zip_file" "$extract_folder" selected_routes.txt