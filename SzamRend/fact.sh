#!/bin/bash

read -p "Enter a number: " szam1

for (( i = $szam1-1; i > 0; i--)); do
    szam1=$(echo "$szam1 * $i" | bc)
done

echo "Factorial: $szam1"