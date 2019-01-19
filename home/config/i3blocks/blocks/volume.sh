#!/usr/bin/env bash

pacmd list-sinks | while read i; do
	echo $i;
done
