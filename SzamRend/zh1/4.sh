#!/bin/bash

szo="$1"
kapcsolo="$2"

if [ $# -ne 2 ]; then
	echo "Hibás bemenet. Helyes bemenet filenév -kapcsoló"
	exit 1
fi

if [ "$2" != "-l" && "$2" != "-u" ]; then
	echo "Hibás kapcsoló. Helyes kapcsolók: -l, -u"
	exit 1
fi
