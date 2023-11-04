#!/usr/bin/awk -f

BEGIN { FS = ": " }

function eprint(type, msg, color) {
	color == "" && color = red
	printf("%s: %s\n", color type reset, msg) > "/dev/stderr"
}

function mprint(pre, msg, post)  {
	printf("%s%9s%s %s%s (%s)%s\n",
		pre bold, msg, reset, id, reset, name, post)
}

function backup() {
	mprint(green, "Copying")
	start = "sudo tmutil startbackup -br -d \"" id "\" 2>&1"
	while ((start | getline) > 0) {
		if ($0 ~ "XPC error") {
			eprint("Error", "Connection interrupted or invalid")
		} else if ($0 ~ "(Total copied|Avg speed)") {
			sub(/:    /, ": ", $0)
			gsub(/[0-9]+\.*[0-9]* MB|[0-9]+\.*[0-9]* MB\/min/,
				bold green "&" reset)
			printf("%s%23s %s\n", reset, $1 ":", $2)
		}
	}
	close(start)

	isempty = index($0, "0 bytes")
	if (isempty > 0) {
		mprint(up clear red, "Stopped")
	} else {
		mprint(up write green, "Complete", down)
	}
}

function getlast() {
	haslast = system("tmutil listbackups 2>&1 | grep 'No backups' >/dev/null")
	if (haslast == 0) {
		printf("\n")
		host="uname -n"
		host | getline hostname
		close(host)
		eprint("Error", "Failed to find any backups for " \
			cyan under hostname reset)
		eprint("Warning", "Back up this machine immediately", yellow)
		exit 1
	}
}

function try() {
	mount == "" ? mprint(gray, "Offline") : backup()
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
