#!/usr/bin/env bash

IP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')

echo -n -e "\xef\x88\xb3: ${IP}"
