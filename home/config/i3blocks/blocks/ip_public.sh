#!/usr/bin/env bash

IP_ADDRESS=$(curl --insecure -s icanhazip.com)

echo -n -e "\xef\x83\x82|${IP_ADDRESS}"
