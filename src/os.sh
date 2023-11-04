#!/bin/sh
set -Cefu

reset='\033[0m' red='\033[31m'

err_msg() {
	printf '%b\n' "${red}error${reset}: $1\n" "$2"
	exit 1
} >&2

check_sys() {
	sys=$(uname -s)

	if [ "$sys" != "Darwin" ]
	then
		err_msg "platform not supported '$sys'." \
			'Please run this script in macOS.'
	fi
}

check_os() {
	os=$(sw_vers -productName)

	if [ "$os" != "macOS" ]
	then
		err_msg "operating system not supported '$os'." \
			'Please run this script in macOS.'
	fi
}

check_ver() {
	ver=$(sw_vers -productVersion)

	if [ "$(echo "$ver < 10.5" | bc -l)" -eq 1 ]
	then
		err_msg "macOS version not supported '$ver'." \
			"Please run this script in macOS 10.5 or higher."
	fi
}

check_sys && check_os && check_ver
