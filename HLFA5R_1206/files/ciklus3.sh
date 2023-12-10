#!/bin/bash

# Ellenőrzi, hogy a bemeneti paraméter meg van-e adva
if [ -z "$1" ]; then
  echo "Hiba: Kérem, adjon meg egy pozitív számot bemeneti paraméterként."
  exit 1
fi

# Ellenőrzi, hogy a bemeneti paraméter egy pozitív egész szám-e
if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]; then
  echo "Hiba: A megadott érték nem egy pozitív egész szám."
  exit 1
fi

number=$1
is_prime=true

# Prímszám ellenőrzése
for ((i=2; i*i<=number; i++))
do
  if [ $((number % i)) -eq 0 ]; then
    is_prime=false
    break
  fi
done

# Eredmény kiírása
if [ "$is_prime" = true ]; then
  echo "$number prím szám."
else
  echo "$number nem prím szám."
fi