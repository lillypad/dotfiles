#!/usr/bin/env bash

if [ -d "/proc/sys/net/ipv4/conf/tun0" ]; then
	echo -n -e "\xef\x81\xb0: on"
else
	echo -n -e "\xef\x81\xae: off"
fi
