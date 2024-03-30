#!/bin/bash

input_file="RAW-Validated.txt"
output_file="NewRawValidated.txt"
while IFS= read -r line; do
    ip_port=$(echo "$line" | awk -F '[|:]' '{print $1 ":" $2}')
    protocol=$(echo "$line" | awk -F '[|:]' '{print $3}')
    case $protocol in
        "socks4") protocol="socks4://";;
        "socks5") protocol="socks5://";;
        "http") protocol="http://";;
        *) protocol="unknown://";;
    esac
    echo "${protocol}${ip_port}" >> "$output_file"
done < "$input_file"

