#!/usr/bin/awk -f

function eprint(type, msg, color) {
	color == "" && color = red
	printf("%s: %s\n", color type reset, msg) > "/dev/stderr"
}

function mprint(msg, color, pre, post)  {
	printf("%s%9s%s %s (%s)%s\n", pre bold color, msg, reset,
		bold id reset, bold color name reset, post)
}

function backup() {
	mprint("Copying", blue)
	cmd = "sudo tmutil startbackup -br -d \"" id "\" 2>&1"
	while ((cmd | getline) > 0) {
		if ($0 ~ "XPC error") {
			eprint("Error", "Connection interrupted or invalid")
		} else if ($0 ~ "(Total copied|Avg speed)") {
			sub(/:    /, ": ", $0)
			gsub(/[0-9]+\.*[0-9]* MB|[0-9]+\.*[0-9]* MB\/min/,
				bold green "&" reset)
			printf("%s%23s %s\n", reset, $1 ":", $2)
		}
	}
	close(cmd)
	isempty = index($0, "0 bytes")
	if (isempty > 0) {
		mprint("Stopped", red, up clear)
	} else {
		mprint("Complete", green, up write, down)
	}
}

function getlast() {
	cmd = "tmutil listbackups 2>&1"
	cmd | getline output
	close(cmd)

	if (output ~ /No backups/) {
		printf("\n")
		cmd = "uname -n"
		cmd | getline hostname
		close(cmd)
		eprint("Error", "Failed to find any backups for " \
			cyan under hostname reset)
		eprint("Warning", "Back up this machine immediately.", yellow)
		exit 1
	}
}

function try() {
	mount == "" ? mprint("Offline", gray) : backup()
}

BEGIN {
	FS  = ": "
	cmd = "tmutil currentphase"
	cmd | getline status
	close(cmd)

	if (!(status ~ /BackupNotRunning/)) {
		eprint("info", "Time Machine operation in progress: " \
			bold blue status reset, blue)
		printf("%s\n", "Please run the script again later.")
		exit 1
	}
}

/Name/ { name=$2 } /ID/ { id = $2 } /Mount Point/ { mount = $2 }
/====/ && name && id {
	try()
	name = id = mount = copied = speed = ""
}

END {
	(name && id) && try()
	getlast()
}
