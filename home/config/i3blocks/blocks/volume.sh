#!/usr/bin/env bash

pacmd list-sinks | sed -e 's/^[ \t]*//' | while read i; do
    if echo $i | grep -Pq '^index:\s'; then
	      break;
    fi
    if echo $i | grep -Pq '^volume:'; then
        echo $i | grep -Po '(\d{1,3}\%){1}' | head -1;
    fi
done
