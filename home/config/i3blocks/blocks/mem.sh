#!/usr/bin/env bash

free --mega | sed 's/ \+ /,/g' | cut -d, -f3 | sed -n '2p' | tr -d '\n' && printf '/' && free --mega | sed 's/ \+ /,/g' | cut -d, -f2 | sed -n '2p' | tr -d '\n'; printf ' MB'
