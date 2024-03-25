#!/bin/bash

url_list="urls.txt"
can_ping=false

while read url; do
    if ping -c 1 "$url" >/dev/null; then
        echo "$url can be pinged."
        can_ping=true
        echo "$url" >> urls_can_ping.txt
    else
        echo "$url cannot be pinged."
    fi
done <"$url_list"

if [ "$can_ping" = false ]; then
    echo "None of the URLs can be pinged."
fi
