#!/bin/sh
set -Cefu

keepalive() {
	sudo -v
	while true
	do
		sudo -n true && sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &
}

main() {
	dir="${0%/*}"
	readonly cmd='/usr/bin/tmutil'

	keepalive
	status

	tmutil destinationinfo |
		awk -f "$dir"/esc.awk -f "$dir"/os.awk -f "${0%.sh}.awk"
}

status() {
	status=$($cmd currentphase)
	case $status in
	BackupNotRunning) start="true" ;;
	esac
}

cleanup() {
	if ${start:-}
	then
		$cmd stopbackup
		$cmd thinlocalsnapshots / 5000000000 2 >/dev/null
	fi
} >&2

trap cleanup INT EXIT QUIT TERM

main "$@"
