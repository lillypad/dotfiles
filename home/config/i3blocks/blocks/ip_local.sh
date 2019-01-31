#!/usr/bin/env bash

IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

echo -n -e "\xef\x88\xb3: ${IP}"
