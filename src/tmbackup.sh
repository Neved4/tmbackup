#!/bin/sh
set -Cefu

dir="${0%/*}"

for path in "$dir/os.sh" "$dir/keepalive.sh"
do
	# shellcheck disable=SC1090
	[ -f "$path" ] && . "$path"
done

cleanup() {
	tmutil currentphase | grep 'Copying' && tmutil stopbackup
	sudo tmutil thinlocalsnapshots / 5000000000 2 >/dev/null
} >&2

trap cleanup INT EXIT QUIT TERM

main() {
	cleanup
	tmutil destinationinfo |
		awk -f "$dir"/color.awk -f "${0%.sh}.awk"
}

main "$@"
