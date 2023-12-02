#!/bin/bash

# Letöltjük a file1.txt fájlt
curl -O https://raw.githubusercontent.com/bbalage/BashExamples/master/assets/file1.txt

# Kiszűrjük a valid email címeket a file1.txt fájlból, és elmentjük az emails.txt fájlba
grep -E -o '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b' file1.txt > emails.txt

# Töröljük az eredetileg letöltött fájlt
rm file1.txt

echo "A valid email címek el lettek mentve az emails.txt fájlba."