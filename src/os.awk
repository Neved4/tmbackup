#!/usr/bin/awk -f

function errmsg(msg, msg2) {
	printf("%s\n", red "error" reset ": " msg "\n" msg2 "\n")
	exit 1
}

function check_sys() {
	cmd = "uname -s"
	cmd | getline sys
	close(cmd)
	if (sys != "Darwin") {
		err_msg("platform not supported '" sys "'.",
			"Please run this script in macOS.")
	}
}

function check_os() {
	cmd = "sw_vers -productName"
	cmd | getline os
	close(cmd)
	if (os != "macOS") {
		errmsg("operating system not supported '" os "'.",
			"Please run this script in macOS.")
	}
}

function check_ver() {
	cmd = "sw_vers -productVersion"
	cmd | getline ver
	close(cmd)
	if (ver < 10.5) {
		errmsg("macOS version not supported '" ver "'.",
			"Please run this script in macOS 10.5 or higher.")
	}
}

BEGIN {
	check_sys() && check_os() && check_ver()
}
