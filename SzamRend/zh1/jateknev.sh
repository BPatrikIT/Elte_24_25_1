#!/bin/bash

read -p "Adja meg a jatekfile nevet: " jatekfile
read -p "Adja meg a jatek helyet: " jatekhely

cp "$jatekfile" "$jatekhely"
