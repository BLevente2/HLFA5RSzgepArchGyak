#!/bin/bash

# Adott fájl neve
input_file="people.csv"

# Kicseréljük a Gmail-es címeket Citromail-es címekre és elmentjük a neptunkod_people.csv fájlba
sed 's/@gmail\.com/@citromail\.hu/g' "$input_file" > HLFA5R_people.csv

echo "Az email címek lecserélve, az új tartalom el lett mentve a HLFA5R_people.csv fájlba."