#!/usr/bin/env bash

DISK=$(df --block-size=GB | sed 's/ \+/,/g' | grep root | head -1 | cut -d, -f3 | tr -d '\n'; printf '/'; df --block-size=GB | sed 's/ \+/,/g' | grep root | head -1 | cut -d, -f4 | tr -d '\n'; printf ' GB')

echo -n -e "\xef\x83\x87: ${DISK}"
