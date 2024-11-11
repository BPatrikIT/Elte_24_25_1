#!/bin/bash

oldalA="$1"
oldalB="$2"

for (( i = 1; i <= $oldalA; i++ )); do
    for (( j = 1; j <= $oldalB; j++ )); do
        echo -n "*"
    done
    echo
done