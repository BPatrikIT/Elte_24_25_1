#!/bin/bash

beolv="$1"
counter=0

while [ "$beolv" != "vége" ]; do
	if [ "$beolv" -lt 10 ]; then
		counter=$((counter + 1))
	fi
done
