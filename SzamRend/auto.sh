#!/bin/bash

# Adatfájl neve
adatfajl="auto_adatok.csv"

# Állások száma
allasok=0

# Adatok beolvasása soronként
while IFS=',' read -r ido sebesseg tavolsag_elo tavolsag_hatul; do
    # Állások meghatározása
    if [ "$sebesseg" -eq 0 ]; then
        
        allasok=$((allasok + 1))
    fi
done < "$adatfajl"

# Eredmény kiírása
echo "Az autó összesen $allasok-szor állt meg."