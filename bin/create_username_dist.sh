#!/usr/bin/env bash

work_dir=$(pwd)

user_dir=$1

cd "$user_dir" || exit

cat ./*/failed_login_data.txt | sed -E -n 's/[a-zA-Z]* [0-9]* [0-9]* ([a-zA-Z0-9_-]*) [0-9.]*/\1/p' | sort | uniq -c | sed -E -n "s/[ ]*([0-9]*) ([a-zA-Z0-9_-]*)/data.addRow(['\2', \1]);/p" > username_dist.txt

cd "$work_dir" || exit

./bin/wrap_contents.sh "$user_dir"/username_dist.txt html_components/username_dist "$user_dir"/username_dist.html
