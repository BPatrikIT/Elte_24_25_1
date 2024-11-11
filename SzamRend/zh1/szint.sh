#!/bin/bash

read -p "Kérem adja meg a szintjét: " szint

if [ "$szint" -gt 20 ]; then
	echo "Nagyobb vagy mint 20as szint"
fi

if [ "$szint" -le 20 ]; then
	echo "Kisebb vagy mint 20as szint"
fi
