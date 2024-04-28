#!/bin/bash

# Converts an IPv4 address to IPv6 using a specific global prefix. This is for keeping static addresses in a dual stack environment and needing a clever way to make a 1:1 mapping. 

convert_to_hex() {
	printf "%02X" $1
}

GLOBAL_PREFIX="2600:1700:1bd0:17af"

# check if input argument is passed
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <IPv4 address>"
	exit 1
fi

IFS='.' read -r -a octets <<< "$1" 

if [ "${#octets[@]}" -ne 4 ]; then
	echo "Invalid IPv4 address format."
	exit 1
fi

hex_ip=""
for i in "${!octets[@]}"; do
	hex_ip+=$(convert_to_hex "${octets[$i]}")
	if [ "$i" -eq 1 ]; then
		hex_ip+=":" # add a colon after the second octet
	fi
done

ipv6_address="${GLOBAL_PREFIX}::$hex_ip"

echo "The IPv6 address is: $ipv6_address/64"
