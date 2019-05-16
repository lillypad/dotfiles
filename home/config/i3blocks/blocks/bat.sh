#!/bin/bash

CHARGING=$(cat /sys/class/power_supply/AC/online)
CAPACITY=0
COUNT=0

while read i; do
	COUNT=$(($COUNT + 1))
	CAPACITY=$(($CAPACITY+`cat $i/capacity`))
done <<<$(find /sys/class/power_supply/ -name "BAT*")

CAPACITY=$(($CAPACITY/$COUNT))

if (( CHARGING == 1 )); then
	echo -e "\xef\x87\xa6|${CAPACITY}%"
else
	if (( CAPACITY > 75 )); then
		echo -e "\xef\x89\x80|${CAPACITY}%";
	fi
	if (( CAPACITY > 50 && CAPACITY <= 75 )); then
		echo -e "\xef\x89\x81|${CAPACITY}%"
	fi
	if (( CAPACITY > 25 && CAPACITY <= 50 )); then
		echo -e "\xef\x89\x82|${CAPACITY}%"
	fi
	if (( CAPACITY > 10 && CAPACITY <= 25 )); then
		echo -e "\xef\x89\x83|${CAPACITY}%"
	fi
	if (( CAPACITY > 0 && CAPACITY <= 10 )); then
		echo -e "\xEF\x89\x84|${CAPACITY}%";
	fi
fi
