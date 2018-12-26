#!/usr/bin/env bash

SONG=$(mpc status | head -1 | grep -Pv '^volume')

if [ "$SONG" == "" ]; then
	echo -n -e "\xef\x96\x8f";
else
	echo -n -e "\xef\x96\x8f: ${SONG}";
fi
