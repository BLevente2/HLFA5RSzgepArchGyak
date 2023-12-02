#!/bin/bash

# Felhasználótól bekérjük az adatokat
read -p "Kérem, adja meg a felhasználónevet: " username
read -p "Kérem, adja meg a verziót: " version
read -p "Kérem, adja meg az oldalt: " site

# Konfigurációs fájl létrehozása
echo "username: $username
version: $version
site: $site" > config.yml

echo "A config.yml fájl létrejött."