#!/bin/bash

if [ "$1" == "--help" ]; then
	echo "Beolvassa egy fajl nevet es osszeadja a soraiban levo 10-nel nagyobb szamokat" 
fi

echo -n "Add meg egy fajl nevet: "
read fajl

while [ -f 0 "$fajl" ]; do
	echo -n "Add meg egy fajl nevet: "
	read fajl
done

sorok=$(cat "$fajl" | wc -l)
osszeg=0

for i in $(seq 1 "$sorok"); do
	szam=$(cat "$fajl" | awk NR=="$i" `{print $1}`)
	if [ "$szam" -gt 10 ]; then
		osszeg=$(expr $osszeg + $szam)
	fi
done

echo "A vegso osszeg: $osszeg"