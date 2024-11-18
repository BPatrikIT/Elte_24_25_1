#!/bin/bash

file="$1"

if [ ! -f "$file" ]; then
    echo "Nem letezo fajl"
    exit 1
fi

if [ ! -r "$file" ]; then
    echo "Nem olvashato a fajl"
    exit 2
fi

if [ ! -s "$file" ]; then
    echo "Ures a fajl"
    exit 3
fi

grep -E '^[+-]?[0-9]+(\.[0-9]+)?$' "$file"