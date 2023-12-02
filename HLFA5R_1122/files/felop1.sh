#!/bin/bash

# Bekérjük az első oldal hosszát
read -p "Kérem, adja meg a téglalap első oldalának hosszát (egész szám): " side1

# Ellenőrizzük, hogy az input egész szám-e
if ! [[ "$side1" =~ ^[0-9]+$ ]]; then
    echo "Hibás bemenet! Kérem, adjon meg egy egész számot."
    exit 1
fi

# Bekérjük a második oldal hosszát
read -p "Kérem, adja meg a téglalap második oldalának hosszát (egész szám): " side2

# Ellenőrizzük, hogy az input egész szám-e
if ! [[ "$side2" =~ ^[0-9]+$ ]]; then
    echo "Hibás bemenet! Kérem, adjon meg egy egész számot."
    exit 1
fi

# Számoljuk ki a téglalap területét
area=$((side1 * side2))

# Kiírjuk a területet
echo "A téglalap területe: $area"