#!/usr/bin/env bash

df | sed 's/ \+/,/g' | grep root | head -1 | cut -d, -f3 | tr -d '\n'; printf ' MB/'; df --block-size=MB | sed 's/ \+/,/g' | grep root | head -1 | cut -d, -f4 | tr -d '\n'; printf ' MB'
