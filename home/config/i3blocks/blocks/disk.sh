#!/usr/bin/env bash

df --block-size=GB | sed 's/ \+/,/g' | grep root | head -1 | cut -d, -f3 | tr -d '\n'; printf '/'; df --block-size=GB | sed 's/ \+/,/g' | grep root | head -1 | cut -d, -f4 | tr -d '\n'; printf ' GB'
