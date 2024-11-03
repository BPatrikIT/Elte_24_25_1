#!/bin/bash

# Adatfájl neve
adatfajl="auto_adatok.csv"

legkozelebb_ido=""
legkozelebb_tavolsag=-1

# Adatok beolvasása soronként
while IFS=',' read -r ido sebesseg tavolsag_elol tavolsag_hatul; do
    # Legközelebbi autó meghatározása
    if [ "$legkozelebb_tavolsag" -eq -1 ]; then
        if [ "$tavolsag_elol -gt $tavolsag_hatul" ]; then
            legkozelebb_ido="$ido"
            legkozelebb_tavolsag="$tavolsag_elol"
        else
            legkozelebb_ido="$ido"
            legkozelebb_tavolsag="$tavolsag_hatul"
        fi
    else
        if [ "$tavolsag_elol -gt $tavolsag_hatul" ]; then
            if [ "$tavolsag_elol" -lt "$legkozelebb_tavolsag" ]; then
                legkozelebb_ido="$ido"
                legkozelebb_tavolsag="$tavolsag_elol"
            fi
        else
            if [ "$tavolsag_hatul" -lt "$legkozelebb_tavolsag" ]; then
                legkozelebb_ido="$ido"
                legkozelebb_tavolsag="$tavolsag_hatul"
            fi
        fi
    fi
    
done < "$adatfajl"

# Eredmény kiírása
echo "Az autó a legközelebb $legkozelebb_ido időpillanatban volt. A távolsága: $legkozelebb_tavolsag."