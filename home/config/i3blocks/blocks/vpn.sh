#!/usr/bin/env bash

if [ -d "/proc/sys/net/ipv4/conf/tun0" ]; then
	echo -n -e "<span color='green'>\xef\x81\xb0</span>"
else
	echo -n -e "<span color='red'>\xef\x81\xae</span>"
fi
