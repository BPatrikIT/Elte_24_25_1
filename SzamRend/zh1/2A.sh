#!/bin/bash

while read -r pontszam; do
	echo "$((pontszam + 1))"
done < "pontszam.csv"
