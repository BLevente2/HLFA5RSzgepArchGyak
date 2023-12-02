#!/bin/bash

# Felhasználótól bekérjük az első koordinátát
read -p "Kérem, adja meg az első koordinátát (x1 y1): " x1 y1

# Felhasználótól bekérjük a második koordinátát
read -p "Kérem, adja meg a második koordinátát (x2 y2): " x2 y2

# Számoljuk ki a téglalap területét
width=$((x2 - x1))
height=$((y2 - y1))
area=$((width * height))

# Kiírjuk a területet
echo "A téglalap területe: $area"