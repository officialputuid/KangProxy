#!/bin/bash

input_file="RAW.txt"
output_file="new_RAW.txt"
while IFS= read -r line; do
    ip_port=$(echo "$line" | awk -F '[|:]' '{print $1 ":" $2}')
    protocol=$(echo "$line" | awk -F '[|:]' '{print $3}')
    case $protocol in
        "http") protocol="http://";;
        "https") protocol="https://";;
        "socks4") protocol="socks4://";;
        "socks5") protocol="socks5://";;
        *) protocol="unknown://";;
    esac
    echo "${protocol}${ip_port}" >> "$output_file"
done < "$input_file"
