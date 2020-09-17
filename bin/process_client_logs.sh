#!/usr/bin/env bash
dir=$1

cd "$dir" || exit 

awk 'match($0, /^([A-Za-z]+)[ ]+([0-9]+ [0-9][0-9]):[0-9:]+ [A-Za-z]+ sshd\[[0-9]+\]: Failed password for[A-Za-z0-9 ]* ([A-Za-z0-9_-]+) from ([0-9]+.[0-9]+.[0-9]+.[0-9]+)/, groups) {print groups[1], groups[2], groups[3], groups[4]}' var/log/* > failed_login_data.txt
