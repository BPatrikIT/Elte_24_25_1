#!/bin/bash

A="$1"
B="$2"

for (( i = 0; i < $1; i++ )); do
    for (( j = 0; j < $2; j++ )); do
        echo -n "*"
    done
    echo
done

echo "K: $((A*2 + B*2))"
echo "T: $((A*B))"