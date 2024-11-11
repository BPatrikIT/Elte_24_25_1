#!/bin/bash

szam1="$1"
operator="$2"
szam2="$3"
if [ $# -ne 3 ]; then
    echo "Usage: $0 \"number1\" \"operator\" \"number2\" fe.: 5 x 3"
    exit 1
fi
case $2 in
    +) result=$(echo "$1 + $3" | bc) ;;
    -) result=$(echo "$1 - $3" | bc) ;;
    x) result=$(echo "$1 * $3" | bc) ;;
    /) result=$(echo "scale=2; $1 / $3" | bc) ;;
    *) echo "Invalid operator"; exit 1 ;;
esac

echo "Result: $result"