#!/bin/bash

# Felhasználótól kérjük be a nevet
read -p "Kérem, adja meg a nevet: " name

# Felhasználótól kérjük be a telefonszámot
read -p "Kérem, adja meg a telefonszámot: " phone

# Fájlba írás
echo "{
 \"name\" : \"$name\",
 \"phone\" : \"$phone\"
}" > HLFA5R.json

echo "Az adatok el lettek mentve a HLFA5R.json fájlba."