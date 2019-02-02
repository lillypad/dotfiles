#!/usr/bin/env bash

VOLUME=$(pacmd list-sinks | pcregrep -a -M '(?<=\*\sindex\:\s)(.+\s+){9}' | grep -Po '(front-left\:\s+\d{1,}\s+\/\s+\d{1,3}\%)' | grep -Po '\d{1,3}(?=\%)')

if [[ -z "$VOLUME" || "$VOLUME" -le "0" ]]; then
	echo -n -e "<span color='red'>\xef\x80\xa6: mute</span>"
	exit 0
fi

if [ "$VOLUME" -gt "50" ]; then
	echo -n -e "\xef\x80\xa8: ${VOLUME}%"
	exit 0
fi

if [[ "$VOLUME" -le "50"  && "$VOLUME" > "0" ]]; then
	echo -n -e "\xef\x80\xa7: ${VOLUME}%"
	exit 0
fi

if [ "$VOLUME" -le "0" ]; then
	echo -n -e "\xef\x80\xa6: ${VOLUME}%"
	exit 0
fi
