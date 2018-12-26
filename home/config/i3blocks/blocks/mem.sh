#!/usr/bin/env bash

MEM=$(free --mega | sed 's/ \+ /,/g' | cut -d, -f3 | sed -n '2p' | tr -d '\n' && printf '/' && free --mega | sed 's/ \+ /,/g' | cut -d, -f2 | sed -n '2p' | tr -d '\n'; printf ' MB')

echo -n -e "\xef\x94\xb8: ${MEM}"
