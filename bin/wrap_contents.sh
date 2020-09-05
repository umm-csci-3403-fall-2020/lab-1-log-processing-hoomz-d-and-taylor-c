#!/usr/bin/env bash

file=$1

header="$2_header.html"

footer=$3

output=$3

cat "$header" "$file" "$footer" > "$output"
