#!/bin/bash

# Ellenőrizzük, hogy két bemeneti paramétert megadtak-e
if [ $# -ne 2 ]; then
    echo "Használat: $0 <szám1> <szám2>"
    exit 1
fi

# Bemeneti paraméterek olvasása
szam1=$1
szam2=$2

# Számok összeadása
osszeg=$(($szam1 + $szam2))
echo "Összeg: $osszeg"

# Számok különbsége
kulonbseg=$(($szam1 - $szam2))
echo "Különbség: $kulonbseg"

# Számok szorzata
szorzat=$(($szam1 * $szam2))
echo "Szorzat: $szorzat"

# Számok hányadosa (valós szám)
hanyados=$(awk "BEGIN {print $szam1 / $szam2}")
echo "Hányados: $hanyados"

# Osztási maradék
maradek=$(($szam1 % $szam2))
echo "Osztási maradék: $maradek"