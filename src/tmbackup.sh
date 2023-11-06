#!/bin/sh
set -Cefu

dir="${0%/*}"

for path in $dir/keepalive.sh
do
	# shellcheck disable=SC1090
	[ -f "$path" ] && . "$path"
done

checkstate() {
	status=$(tmutil currentphase)
	case $status in
	BackupNotRunning)
		start="true" ;;
	esac
}

cleanup() {
	if ${start:-}
	then
		tmutil stopbackup
		tmutil thinlocalsnapshots / 5000000000 2 >/dev/null
	fi
} >&2

trap cleanup INT EXIT QUIT TERM

main() {
	checkstate
	tmutil destinationinfo |
		awk -f "$dir"/color.awk -f "$dir"/os.awk -f "${0%.sh}.awk"
}

main "$@"
