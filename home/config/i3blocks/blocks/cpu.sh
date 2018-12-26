#!/usr/bin/env bash

CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')

echo -n -e "\xef\x8b\x9b: ${CPU}"
