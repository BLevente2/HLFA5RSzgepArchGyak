#!/bin/bash

# Tömb inicializálása és feltöltése véletlen számokkal
for ((i=0; i<10; i++))
do
  array[i]=$((RANDOM % 100))  # Véletlen számok 0 és 99 között
done

echo "Eredeti tömb:"
echo "${array[@]}"

# Tömb elemeinek növelése 1-gyel
for ((i=0; i<10; i++))
do
  array[i]=$((array[i] + 1))
done

echo "Tömb elemei növelve 1-gyel:"
echo "${array[@]}"