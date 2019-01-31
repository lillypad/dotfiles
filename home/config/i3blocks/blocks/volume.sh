#!/usr/bin/env bash

VOLUME=$(pacmd list-sinks | pcregrep -a -M '(?<=\*\sindex\:\s)(.+\s+){9}' | grep -Po '(?<=front-left\:\s\d{5}\s\/)\s+\d{1,}' | sed 's/\s//g')

if [ "$VOLUME" -gt "50" ]; then
	echo -n -e "\xef\x80\xa8: ${VOLUME}%"
fi

if [[ "$VOLUME" -lt "50"  && "$VOLUME" > "0" ]]; then
	echo -n -e "\xef\x80\xa7: ${VOLUME}%"
fi

if [ "$VOLUME" -le "0" ]; then
	echo -n -e "\xef\x80\xa6: ${VOLUME}%"
fi
