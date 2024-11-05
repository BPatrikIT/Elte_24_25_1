#!/bin/sh

if [ "$1" -lt 1 ] || [ "$1" -gt 9 ]; then
	echo "Hibas parametert adtal meg"
else
	for i in $(seq 1 "$1"); do
	
		for j in $(seq "$i" "$1"); do
			echo -n "$j"
		done
		
		if [ "$i" -ne "$1" ]; then 
			masik=$(expr $1 - $i)
		
			for k in $(seq 1 "$masik"); do
				echo -n "$k"
			done
		elif [ "$i" -eq "$1" ]
			masik=$(expr $1 - 1)
			
			for f in $(seq 1 "$masik"); do
				echo -n "$f"
			done
			
		fi
		
		echo
		
	done
fi