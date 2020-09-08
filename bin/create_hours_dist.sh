
#!/usr/bin/env bash

work_dir=$(pwd)

hours_dir=$1

cd "$hours_dir" || exit

cat ./*/failed_login_data.txt | awk '{print $3}' | sort | uniq -c | sed -E -n "s/[ ]*([0-9]*) ([a-zA-Z0-9_-]*)/data.addRow(['\2', \1]);/p" > hours_dist.txt

cd "$work_dir" || exit

./bin/wrap_contents.sh "$hours_dir"/hours_dist.txt html_components/hours_dist "$hours_dir"/hours_dist.html
