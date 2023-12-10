#!/bin/bash

# For ciklus
echo "For ciklus:"
for ((i=0; i<=10; i++))
do
  echo $i
done

# While ciklus
echo "While ciklus:"
i=0
while [ $i -le 10 ]
do
  echo $i
  ((i++))
done

# Until ciklus
echo "Until ciklus:"
i=0
until [ $i -gt 10 ]
do
  echo $i
  ((i++))
done