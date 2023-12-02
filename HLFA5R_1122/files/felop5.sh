!/bin/bash

# Bekérjük a felhasználótól a téglalap oldalainak hosszát
read -p "Kérem, adja meg a téglalap első oldalának hosszát: " side1
read -p "Kérem, adja meg a téglalap második oldalának hosszát: " side2

# Ellenőrizzük, hogy a bemenet érvényes lebegőpontos számok-e
if ! [[ "$side1" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$side2" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Hibás bemenet! Kérem, adjon meg érvényes lebegőpontos számokat!"
    exit 1
fi

# Kiszámoljuk a téglalap területét
area=$(echo "$side1 * $side2" | bc)

# Kiírjuk a területet
echo "A téglalap területe: $area"