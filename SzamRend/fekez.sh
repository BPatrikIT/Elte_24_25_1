#!/bin/bash

# Adatfájl neve
adatfajl="auto_adatok.csv"

# Küszöbérték
kuszob="$1"

# Fékezések száma
fekezesek=0

# Adatok beolvasása soronként
while IFS=',' read -r ido sebesseg tavolsag_elol tavolsag_hatul; do
    # Fékezések meghatározása
    if [ "$sebesseg" -gt "$kuszob" ]; then
        fekezesek=$((fekezesek + 1))
    fi
done < "$adatfajl"

# Eredmény kiírása
echo "Az autó összesen $fekezesek-szor fékezett."