#!/usr/bin/env bash

SONG=$(mpc status | head -1 | grep -Pv '^volume')

if [ "$SONG" == "" ]; then
	echo -n -e "\xef\x80\x81|";
else
	echo -n -e "\xef\x80\x81|${SONG}" | sed 's/\&/\&amp;/g';
fi
