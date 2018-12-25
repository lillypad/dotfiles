#!/usr/bin/env bash

SONG=$(mpc status | head -1 | grep -Pv '^volume')

if [ "$SONG" == "" ]; then
	echo "stopped";
else
	echo $SONG;
fi
