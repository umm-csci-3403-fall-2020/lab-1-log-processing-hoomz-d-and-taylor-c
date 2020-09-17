#!/usr/bin/env bash

work_dir=$(pwd)

country_dir=$1

cd "$country_dir" || exit

cat ./*/failed_login_data.txt | awk '{print $5}' | sort | join - "$work_dir"/etc/country_IP_map.txt | awk '{print $2};' | sort | uniq -c | sed -E -n "s/[ ]*([0-9]*) ([a-zA-Z0-9_-]*)/data.addRow(['\2', \1]);/p" > country_dist.txt

"$work_dir"/bin/wrap_contents.sh country_dist.txt "$work_dir"/html_components/country_dist country_dist.html
