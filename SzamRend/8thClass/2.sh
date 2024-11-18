#!/bin/bash

file="$1"

grep -c '^[a-zA-Z]*$' "$1"