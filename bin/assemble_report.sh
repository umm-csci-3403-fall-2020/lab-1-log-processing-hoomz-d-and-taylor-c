#!/usr/bin/env bash

work_dir=$(pwd)

assemble_dir=$1

cd "$assemble_dir" || exit

cat country_dist.html hours_dist.html username_dist.html > assemble.html

"$work_dir"/bin/wrap_contents.sh assemble.html "$work_dir"/html_components/summary_plots failed_login_summary.html
