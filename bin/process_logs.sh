#!/usr/bin/env bash

# setup temporary directory to work in
scratch=$(mktemp --directory)

# loop through all arguments
for i in "$@"
do
	name=$(basename "$i" .tgz)
	mkdir -p "$scratch"/"$name"
	tar -xzf $i -C "$scratch"/"$name"
	./bin/process_client_logs.sh "$scratch"/"$name";
done

# run each of the processing scripts on the temp path
bin/create_hours_dist.sh "$scratch"
bin/create_username_dist.sh "$scratch"
bin/create_country_dist.sh "$scratch"
bin/assemble_report.sh "$scratch"

# move the generated summary into the path this script was run in
mv "$scratch"/failed_login_summary.html failed_login_summary.html

# clean up the temporary directory
rm -rf "$scratch"
