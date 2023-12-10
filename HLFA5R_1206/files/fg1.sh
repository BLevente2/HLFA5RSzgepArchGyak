#!/bin/bash

# Összeadó függvény definíciója
osszead() {
  local sum=0
  
  # Ellenőrzi, hogy vannak-e argumentumok
  if [ "$#" -eq 0 ]; then
    echo 0
    return
  fi

  # Argumentumok összeadása
  for arg in "$@"
  do
    sum=$((sum + arg))
  done

  echo $sum
}

# Függvény hívása argumentumokkal
result=$(osszead 2 5 7)
echo "Eredmény: $result"

# Függvény hívása argumentumok nélkül
result=$(osszead)
echo "Eredmény üres argumentumokkal: $result"