#!/bin/bash

# Véletlen szám generálása 1 és 100 között
random_number=$((RANDOM % 100 + 1))

echo "Véletlen szám: $random_number"

echo "Négyzetszámok, amelyek kisebbek a generált számnál:"

# Ciklus a négyzetszámok kiírására
for ((i=1; i*i<random_number; i++))
do
  square=$((i*i))
  echo $square
done