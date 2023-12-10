#!/bin/bash

# N beolvasása és ellenőrzése
read -p "Kérem, adjon meg egy pozitív egész számot (N): " n

if ! [[ "$n" =~ ^[1-9][0-9]*$ ]]; then
  echo "Hiba: A megadott érték nem pozitív egész szám."
  exit 1
fi

# Tömb inicializálása és feltöltése véletlen számokkal
for ((i=0; i<n; i++))
do
  array[i]=$((RANDOM % 100 + 1))  # Véletlen számok 1 és 100 között
done

# Tömb elemeinek kiíratása
echo "Tömb elemei:"
echo "${array[@]}"

# Minimum elem kiíratása
min_index=0
min_value=${array[0]}
for ((i=1; i<n; i++))
do
  if [ "${array[i]}" -lt "$min_value" ]; then
    min_index=$i
    min_value=${array[i]}
  fi
done
echo "Minimum elem: ${min_index} (${min_value})"

# Maximum elem kiíratása
max_index=0
max_value=${array[0]}
for ((i=1; i<n; i++))
do
  if [ "${array[i]}" -gt "$max_value" ]; then
    max_index=$i
    max_value=${array[i]}
  fi
done
echo "Maximum elem: ${max_index} (${max_value})"

# Elemek összege
sum=0
for ((i=0; i<n; i++))
do
  ((sum+=array[i]))
done
echo "Elemek összege: $sum"

# Elemek átlaga
average=$(echo "scale=2; $sum / $n" | bc)
echo "Elemek átlaga: $average"