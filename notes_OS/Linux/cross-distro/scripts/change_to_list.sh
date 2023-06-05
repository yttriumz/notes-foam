#!/bin/bash

input_file="china_can_ping.txt"
output_file="processed_urls.txt"

while read url; do
    processed_url="wss://$url"
    echo "\"$processed_url\"," >> "$output_file"
done < "$input_file"
