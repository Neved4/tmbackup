#!/bin/sh
set -Cefu

dir="${0%/*}"

for file in "$dir/os.sh" "$dir/keepalive.sh"
do
	# shellcheck disable=SC1090
	[ -f "$file" ] && . "$file"
done

tmutil destinationinfo | awk -f "${0%.sh}.awk"
sudo tmutil thinlocalsnapshots / 1000000000 1 >/dev/null
